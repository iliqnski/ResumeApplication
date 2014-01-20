using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;

namespace ResumeApplication.Web.Models
{
    public static class XmlNodeExtensions
    {
        /// <summary>
        /// XmlNode class extension method.
        /// </summary>
        /// <param name="node">XmlNode node</param>
        /// <param name="tagName">string tagName</param>
        /// <returns>Returns the inner text of the node</returns>
        public static string GetChildText(this XmlNode node, string tagName)              
        {
            XmlNode childNode = node.SelectSingleNode(tagName);
            if (childNode == null)
            {
                return null;
            }
            else
            {
                return childNode.InnerText;
            }
        }
    }
}