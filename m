Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB485204694
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 16:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736354271; cv=none; b=rQaYuJ4BhxN9JLqjHTCjeTHtOMwqv8Yp5KorhzpvUlO0pX2byHg7DlEf8DdPvSWqby4GTSC9vf7ZRQLqMF7ZOxym23pUfSFJdCe5XxHmg3BDJLpmLr1VYxpBox7N8VJkV0q6eUMSksoV5qAf5TDY7RBMAuJ9eG0oxE1V1Gym5YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736354271; c=relaxed/simple;
	bh=62a7JZ+I8JDSiy9uDX5WKcOSx8mTAasY3yZH8yoevbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eLiyVCGvvo2mjA8Uci9m/Go52zMbSodqmqKwNgwMM3u4j1zGUFWTvrdA7mzE7I63d/1vQH+upX1hiZ2NAw5si05/TRF+BqzmFzXLXM+H+AgD+x2dO2DMUuGM7XzkPMdzqQrCRmUVl/wunURhfw0gMtUUEkAJs4afUe/UrGUtMoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wl50F0Oo; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wl50F0Oo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736354269; x=1767890269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=62a7JZ+I8JDSiy9uDX5WKcOSx8mTAasY3yZH8yoevbQ=;
  b=Wl50F0Oo5Tv/k5i7iGiubfOGJfkMqeNo9hnI9wRMVrpa7TBcE6G+lgDZ
   j4BTjBwBNIZG+C5k96R2N52Y1tCggrlyPDzFwoCSDTbNG/NeqCVEhYyYB
   3nTgEDl1zYHcPBmUu5ToU4ZkVujBkXLfgwtFAWTd7oBUatkmqJmXGOlrh
   jXjoie3RtDxk+z+FxF8hrNfD9CypG1yNe4yzdFqa0jobbl0LpotJCjCGY
   mJmIVO1UJtI+d0p6j4Y1AYjRY2N22H2jm6zwnvlatmSkbSAfHv1hdPk8C
   OImFUSmuiDEZ7lyv433TDzNnOVirll3klWCzRnAnYW/wdfb+27N520weP
   A==;
X-CSE-ConnectionGUID: VXaVsJmrSYm4V5lt+mR6fA==
X-CSE-MsgGUID: +7uF6GN7SEGHB1QMNei/fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36810118"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="36810118"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 08:37:48 -0800
X-CSE-ConnectionGUID: Ve8JYCHpR927SVy5mXBegw==
X-CSE-MsgGUID: imtZra/RT2+mTR9ORd3cBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103006780"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Jan 2025 08:37:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVZ3v-000GND-2f;
	Wed, 08 Jan 2025 16:37:43 +0000
Date: Thu, 9 Jan 2025 00:36:45 +0800
From: kernel test robot <lkp@intel.com>
To: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Pablo Neira Ayuso <pablo@netfilter.org>
Subject: net/netfilter/ipvs/ip_vs_core.c:1666:15: warning: variable
 'outer_proto' set but not used
Message-ID: <202501090033.FQ3VZKyh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Haishuang,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   09a0fa92e5b45e99cf435b2fbf5ebcf889cf8780
commit: 73348fed35d023e998cbd303a28400f2c0ec30a3 ipvs: optimize tunnel dumps for icmp errors
date:   4 years, 9 months ago
config: alpha-randconfig-r025-20220508 (https://download.01.org/0day-ci/archive/20250109/202501090033.FQ3VZKyh-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501090033.FQ3VZKyh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501090033.FQ3VZKyh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/netfilter/ipvs/ip_vs_core.c: In function 'ip_vs_in_icmp':
>> net/netfilter/ipvs/ip_vs_core.c:1666:15: warning: variable 'outer_proto' set but not used [-Wunused-but-set-variable]
    1666 |         char *outer_proto;
         |               ^~~~~~~~~~~


vim +/outer_proto +1666 net/netfilter/ipvs/ip_vs_core.c

  1645	
  1646	/*
  1647	 *	Handle ICMP messages in the outside-to-inside direction (incoming).
  1648	 *	Find any that might be relevant, check against existing connections,
  1649	 *	forward to the right destination host if relevant.
  1650	 *	Currently handles error types - unreachable, quench, ttl exceeded.
  1651	 */
  1652	static int
  1653	ip_vs_in_icmp(struct netns_ipvs *ipvs, struct sk_buff *skb, int *related,
  1654		      unsigned int hooknum)
  1655	{
  1656		struct iphdr *iph;
  1657		struct icmphdr	_icmph, *ic;
  1658		struct iphdr	_ciph, *cih;	/* The ip header contained within the ICMP */
  1659		struct ip_vs_iphdr ciph;
  1660		struct ip_vs_conn *cp;
  1661		struct ip_vs_protocol *pp;
  1662		struct ip_vs_proto_data *pd;
  1663		unsigned int offset, offset2, ihl, verdict;
  1664		bool tunnel, new_cp = false;
  1665		union nf_inet_addr *raddr;
> 1666		char *outer_proto;
  1667	
  1668		*related = 1;
  1669	
  1670		/* reassemble IP fragments */
  1671		if (ip_is_fragment(ip_hdr(skb))) {
  1672			if (ip_vs_gather_frags(ipvs, skb, ip_vs_defrag_user(hooknum)))
  1673				return NF_STOLEN;
  1674		}
  1675	
  1676		iph = ip_hdr(skb);
  1677		offset = ihl = iph->ihl * 4;
  1678		ic = skb_header_pointer(skb, offset, sizeof(_icmph), &_icmph);
  1679		if (ic == NULL)
  1680			return NF_DROP;
  1681	
  1682		IP_VS_DBG(12, "Incoming ICMP (%d,%d) %pI4->%pI4\n",
  1683			  ic->type, ntohs(icmp_id(ic)),
  1684			  &iph->saddr, &iph->daddr);
  1685	
  1686		/*
  1687		 * Work through seeing if this is for us.
  1688		 * These checks are supposed to be in an order that means easy
  1689		 * things are checked first to speed up processing.... however
  1690		 * this means that some packets will manage to get a long way
  1691		 * down this stack and then be rejected, but that's life.
  1692		 */
  1693		if ((ic->type != ICMP_DEST_UNREACH) &&
  1694		    (ic->type != ICMP_SOURCE_QUENCH) &&
  1695		    (ic->type != ICMP_TIME_EXCEEDED)) {
  1696			*related = 0;
  1697			return NF_ACCEPT;
  1698		}
  1699	
  1700		/* Now find the contained IP header */
  1701		offset += sizeof(_icmph);
  1702		cih = skb_header_pointer(skb, offset, sizeof(_ciph), &_ciph);
  1703		if (cih == NULL)
  1704			return NF_ACCEPT; /* The packet looks wrong, ignore */
  1705		raddr = (union nf_inet_addr *)&cih->daddr;
  1706	
  1707		/* Special case for errors for IPIP/UDP/GRE tunnel packets */
  1708		tunnel = false;
  1709		if (cih->protocol == IPPROTO_IPIP) {
  1710			struct ip_vs_dest *dest;
  1711	
  1712			if (unlikely(cih->frag_off & htons(IP_OFFSET)))
  1713				return NF_ACCEPT;
  1714			/* Error for our IPIP must arrive at LOCAL_IN */
  1715			if (!(skb_rtable(skb)->rt_flags & RTCF_LOCAL))
  1716				return NF_ACCEPT;
  1717			dest = ip_vs_find_tunnel(ipvs, AF_INET, raddr, 0);
  1718			/* Only for known tunnel */
  1719			if (!dest || dest->tun_type != IP_VS_CONN_F_TUNNEL_TYPE_IPIP)
  1720				return NF_ACCEPT;
  1721			offset += cih->ihl * 4;
  1722			cih = skb_header_pointer(skb, offset, sizeof(_ciph), &_ciph);
  1723			if (cih == NULL)
  1724				return NF_ACCEPT; /* The packet looks wrong, ignore */
  1725			tunnel = true;
  1726			outer_proto = "IPIP";
  1727		} else if ((cih->protocol == IPPROTO_UDP ||	/* Can be UDP encap */
  1728			    cih->protocol == IPPROTO_GRE) &&	/* Can be GRE encap */
  1729			   /* Error for our tunnel must arrive at LOCAL_IN */
  1730			   (skb_rtable(skb)->rt_flags & RTCF_LOCAL)) {
  1731			__u8 iproto;
  1732			int ulen;
  1733	
  1734			/* Non-first fragment has no UDP/GRE header */
  1735			if (unlikely(cih->frag_off & htons(IP_OFFSET)))
  1736				return NF_ACCEPT;
  1737			offset2 = offset + cih->ihl * 4;
  1738			if (cih->protocol == IPPROTO_UDP) {
  1739				ulen = ipvs_udp_decap(ipvs, skb, offset2, AF_INET,
  1740						      raddr, &iproto);
  1741				outer_proto = "UDP";
  1742			} else {
  1743				ulen = ipvs_gre_decap(ipvs, skb, offset2, AF_INET,
  1744						      raddr, &iproto);
  1745				outer_proto = "GRE";
  1746			}
  1747			if (ulen > 0) {
  1748				/* Skip IP and UDP/GRE tunnel headers */
  1749				offset = offset2 + ulen;
  1750				/* Now we should be at the original IP header */
  1751				cih = skb_header_pointer(skb, offset, sizeof(_ciph),
  1752							 &_ciph);
  1753				if (cih && cih->version == 4 && cih->ihl >= 5 &&
  1754				    iproto == IPPROTO_IPIP)
  1755					tunnel = true;
  1756				else
  1757					return NF_ACCEPT;
  1758			}
  1759		}
  1760	
  1761		pd = ip_vs_proto_data_get(ipvs, cih->protocol);
  1762		if (!pd)
  1763			return NF_ACCEPT;
  1764		pp = pd->pp;
  1765	
  1766		/* Is the embedded protocol header present? */
  1767		if (unlikely(cih->frag_off & htons(IP_OFFSET) &&
  1768			     pp->dont_defrag))
  1769			return NF_ACCEPT;
  1770	
  1771		IP_VS_DBG_PKT(11, AF_INET, pp, skb, offset,
  1772			      "Checking incoming ICMP for");
  1773	
  1774		offset2 = offset;
  1775		ip_vs_fill_iph_skb_icmp(AF_INET, skb, offset, !tunnel, &ciph);
  1776		offset = ciph.len;
  1777	
  1778		/* The embedded headers contain source and dest in reverse order.
  1779		 * For IPIP/UDP/GRE tunnel this is error for request, not for reply.
  1780		 */
  1781		cp = INDIRECT_CALL_1(pp->conn_in_get, ip_vs_conn_in_get_proto,
  1782				     ipvs, AF_INET, skb, &ciph);
  1783	
  1784		if (!cp) {
  1785			int v;
  1786	
  1787			if (tunnel || !sysctl_schedule_icmp(ipvs))
  1788				return NF_ACCEPT;
  1789	
  1790			if (!ip_vs_try_to_schedule(ipvs, AF_INET, skb, pd, &v, &cp, &ciph))
  1791				return v;
  1792			new_cp = true;
  1793		}
  1794	
  1795		verdict = NF_DROP;
  1796	
  1797		/* Ensure the checksum is correct */
  1798		if (!skb_csum_unnecessary(skb) && ip_vs_checksum_complete(skb, ihl)) {
  1799			/* Failed checksum! */
  1800			IP_VS_DBG(1, "Incoming ICMP: failed checksum from %pI4!\n",
  1801				  &iph->saddr);
  1802			goto out;
  1803		}
  1804	
  1805		if (tunnel) {
  1806			__be32 info = ic->un.gateway;
  1807			__u8 type = ic->type;
  1808			__u8 code = ic->code;
  1809	
  1810			/* Update the MTU */
  1811			if (ic->type == ICMP_DEST_UNREACH &&
  1812			    ic->code == ICMP_FRAG_NEEDED) {
  1813				struct ip_vs_dest *dest = cp->dest;
  1814				u32 mtu = ntohs(ic->un.frag.mtu);
  1815				__be16 frag_off = cih->frag_off;
  1816	
  1817				/* Strip outer IP and ICMP, go to IPIP/UDP/GRE header */
  1818				if (pskb_pull(skb, ihl + sizeof(_icmph)) == NULL)
  1819					goto ignore_tunnel;
  1820				offset2 -= ihl + sizeof(_icmph);
  1821				skb_reset_network_header(skb);
  1822				IP_VS_DBG(12, "ICMP for %s %pI4->%pI4: mtu=%u\n",
  1823					  outer_proto, &ip_hdr(skb)->saddr,
  1824					  &ip_hdr(skb)->daddr, mtu);
  1825				ipv4_update_pmtu(skb, ipvs->net, mtu, 0, 0);
  1826				/* Client uses PMTUD? */
  1827				if (!(frag_off & htons(IP_DF)))
  1828					goto ignore_tunnel;
  1829				/* Prefer the resulting PMTU */
  1830				if (dest) {
  1831					struct ip_vs_dest_dst *dest_dst;
  1832	
  1833					dest_dst = rcu_dereference(dest->dest_dst);
  1834					if (dest_dst)
  1835						mtu = dst_mtu(dest_dst->dst_cache);
  1836				}
  1837				if (mtu > 68 + sizeof(struct iphdr))
  1838					mtu -= sizeof(struct iphdr);
  1839				info = htonl(mtu);
  1840			}
  1841			/* Strip outer IP, ICMP and IPIP/UDP/GRE, go to IP header of
  1842			 * original request.
  1843			 */
  1844			if (pskb_pull(skb, offset2) == NULL)
  1845				goto ignore_tunnel;
  1846			skb_reset_network_header(skb);
  1847			IP_VS_DBG(12, "Sending ICMP for %pI4->%pI4: t=%u, c=%u, i=%u\n",
  1848				&ip_hdr(skb)->saddr, &ip_hdr(skb)->daddr,
  1849				type, code, ntohl(info));
  1850			icmp_send(skb, type, code, info);
  1851			/* ICMP can be shorter but anyways, account it */
  1852			ip_vs_out_stats(cp, skb);
  1853	
  1854	ignore_tunnel:
  1855			consume_skb(skb);
  1856			verdict = NF_STOLEN;
  1857			goto out;
  1858		}
  1859	
  1860		/* do the statistics and put it back */
  1861		ip_vs_in_stats(cp, skb);
  1862		if (IPPROTO_TCP == cih->protocol || IPPROTO_UDP == cih->protocol ||
  1863		    IPPROTO_SCTP == cih->protocol)
  1864			offset += 2 * sizeof(__u16);
  1865		verdict = ip_vs_icmp_xmit(skb, cp, pp, offset, hooknum, &ciph);
  1866	
  1867	out:
  1868		if (likely(!new_cp))
  1869			__ip_vs_conn_put(cp);
  1870		else
  1871			ip_vs_conn_put(cp);
  1872	
  1873		return verdict;
  1874	}
  1875	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
