Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D8E111A8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 May 2024 11:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714907879; cv=none; b=GSFmAQs+R9FtlvzF7thwnaBj0o1lweQrJWLVIiE1TLLrXoYsAyzPWydIOPaSzQxOjyC12MyPXWpjGGJZjVoUOo+U97QOCeTEUsFIwKdYPhPwCS6fMLd2Izovh0TCoenGQeYmizfwoxyx3e92wTx3eFAaKqj3FP8m1vRed9umwuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714907879; c=relaxed/simple;
	bh=a3PV2ppPXW4XMd2guphHR1Ns0jWHoz9w76RPu83CWAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GVVRfe/cxnwxzysRRDSvvfd00fpQp5y0WDafQXfsSlsuDhk2gbEHrBtn6s13zJiVT0breIDn7h4zxmVAF+spyBTOXi/Me/Qu2TCYDuXm7KYPJbsNarHuMYz9USUimyR5Db6ZRW3Pyc4nyvplHokjDGOSiNZeBqEQxJ3yvC/4QCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J3EvNM/K; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J3EvNM/K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714907877; x=1746443877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a3PV2ppPXW4XMd2guphHR1Ns0jWHoz9w76RPu83CWAc=;
  b=J3EvNM/K1toYhe9dR9qHi+ywr9i380VPIiF+omFTZt4bIytGTIbPGt6a
   NetgF7H5sfV988D5aiIlOcuyw8agWpAo0hg4um0SAFraIFQ8UKrjFAIYe
   m+LdlSa9xmvdZlPypMfTc0szbilH4WZhX1KR28eA1BZLWGGAAc0HWwPR6
   zdP7jPNflmDKPEO/bNL+shK8TfQNWJdjHh9qTy1i3+gPrYdruWq71k30r
   yxFZA8huKhDrlxVSjriIEkrQLErD3LXgNAA4iwvedPCrA5uEkDBI1CxoO
   3m/j6XIuG5PV9qPVWgMYM8lxmSPwyt6/e7U588N9mHXrZmXo1TS8vd75m
   w==;
X-CSE-ConnectionGUID: 5FL0RcbHRy2IUlxgqoEVPQ==
X-CSE-MsgGUID: lkLdQYpjSACBVwJcqtkuUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="33172981"
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="33172981"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 04:17:57 -0700
X-CSE-ConnectionGUID: 9iNwIt0kQOuV06ZVBi6m8w==
X-CSE-MsgGUID: QFRJsO2GQTqQmeOOP/t3Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="27986745"
Received: from lkp-server01.sh.intel.com (HELO 123fad1cf874) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 May 2024 04:17:55 -0700
Received: from kbuild by 123fad1cf874 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3ZsP-00009c-1r;
	Sun, 05 May 2024 11:17:53 +0000
Date: Sun, 5 May 2024 19:16:54 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Hutchings <bwh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.4.y-st-rc 2244/2247] drivers/net/vxlan.c:1190:10:
 warning: 'return' with a value, in function returning void
Message-ID: <202405051957.swCEY1g7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st-rc
head:   ef9c8224c182965fc619b512ec14e478cae6dd08
commit: 14bb6b12a4abe7a755e5c8eb81365a53deffb795 [2244/2247] vxlan: drop packets from invalid src-address
config: i386-randconfig-004-20240505 (https://download.01.org/0day-ci/archive/20240505/202405051957.swCEY1g7-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240505/202405051957.swCEY1g7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405051957.swCEY1g7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/vxlan.c: In function 'vxlan_rcv':
>> drivers/net/vxlan.c:1190:10: warning: 'return' with a value, in function returning void
      return false;
             ^~~~~
   drivers/net/vxlan.c:1159:13: note: declared here
    static void vxlan_rcv(struct vxlan_sock *vs, struct sk_buff *skb,
                ^~~~~~~~~
   drivers/net/vxlan.c: In function 'neigh_reduce':
   drivers/net/vxlan.c:1552:25: warning: variable 'saddr' set but not used [-Wunused-but-set-variable]
     const struct in6_addr *saddr, *daddr;
                            ^~~~~
   In file included from include/linux/rhashtable.h:24:0,
                    from include/net/inet_frag.h:4,
                    from include/net/netns/ipv4.h:9,
                    from include/net/net_namespace.h:17,
                    from include/linux/netdevice.h:43,
                    from drivers/net/vxlan.c:20:
   include/linux/jhash.h: In function 'jhash':
   include/linux/jhash.h:90:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
     case 12: c += (u32)k[11]<<24;
              ~~^~~~~~~~~~~~~~~~~
   include/linux/jhash.h:91:2: note: here
     case 11: c += (u32)k[10]<<16;
     ^~~~
   include/linux/jhash.h:91:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
     case 11: c += (u32)k[10]<<16;
              ~~^~~~~~~~~~~~~~~~~
   include/linux/jhash.h:92:2: note: here
     case 10: c += (u32)k[9]<<8;
     ^~~~
   include/linux/jhash.h:92:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
     case 10: c += (u32)k[9]<<8;
              ~~^~~~~~~~~~~~~~~
   include/linux/jhash.h:93:2: note: here
     case 9:  c += k[8];
     ^~~~
   include/linux/jhash.h:93:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
     case 9:  c += k[8];
              ~~^~~~~~~
   include/linux/jhash.h:94:2: note: here
     case 8:  b += (u32)k[7]<<24;
     ^~~~
   include/linux/jhash.h:94:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
     case 8:  b += (u32)k[7]<<24;
              ~~^~~~~~~~~~~~~~~~
   include/linux/jhash.h:95:2: note: here
     case 7:  b += (u32)k[6]<<16;
     ^~~~
   include/linux/jhash.h:95:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
     case 7:  b += (u32)k[6]<<16;
              ~~^~~~~~~~~~~~~~~~
   include/linux/jhash.h:96:2: note: here
     case 6:  b += (u32)k[5]<<8;
     ^~~~
   include/linux/jhash.h:96:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
     case 6:  b += (u32)k[5]<<8;
              ~~^~~~~~~~~~~~~~~
   include/linux/jhash.h:97:2: note: here
     case 5:  b += k[4];
     ^~~~
   include/linux/jhash.h:97:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
     case 5:  b += k[4];
              ~~^~~~~~~
   include/linux/jhash.h:98:2: note: here
     case 4:  a += (u32)k[3]<<24;
     ^~~~
   include/linux/jhash.h:98:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
     case 4:  a += (u32)k[3]<<24;
              ~~^~~~~~~~~~~~~~~~
   include/linux/jhash.h:99:2: note: here
     case 3:  a += (u32)k[2]<<16;
     ^~~~
   include/linux/jhash.h:99:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
     case 3:  a += (u32)k[2]<<16;
              ~~^~~~~~~~~~~~~~~~
   include/linux/jhash.h:100:2: note: here
     case 2:  a += (u32)k[1]<<8;
     ^~~~
   include/linux/jhash.h:100:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
     case 2:  a += (u32)k[1]<<8;
              ~~^~~~~~~~~~~~~~~
   include/linux/jhash.h:101:2: note: here
     case 1:  a += k[0];
     ^~~~


vim +/return +1190 drivers/net/vxlan.c

  1158	
  1159	static void vxlan_rcv(struct vxlan_sock *vs, struct sk_buff *skb,
  1160			      struct vxlan_metadata *md, u32 vni,
  1161			      struct metadata_dst *tun_dst)
  1162	{
  1163		struct iphdr *oip = NULL;
  1164		struct ipv6hdr *oip6 = NULL;
  1165		struct vxlan_dev *vxlan;
  1166		struct pcpu_sw_netstats *stats;
  1167		union vxlan_addr saddr;
  1168		int err = 0;
  1169	
  1170		/* For flow based devices, map all packets to VNI 0 */
  1171		if (vs->flags & VXLAN_F_COLLECT_METADATA)
  1172			vni = 0;
  1173	
  1174		/* Is this VNI defined? */
  1175		vxlan = vxlan_vs_find_vni(vs, vni);
  1176		if (!vxlan)
  1177			goto drop;
  1178	
  1179		skb_reset_mac_header(skb);
  1180		skb_scrub_packet(skb, !net_eq(vxlan->net, dev_net(vxlan->dev)));
  1181		skb->protocol = eth_type_trans(skb, vxlan->dev);
  1182		skb_postpull_rcsum(skb, eth_hdr(skb), ETH_HLEN);
  1183	
  1184		/* Ignore packet loops (and multicast echo) */
  1185		if (ether_addr_equal(eth_hdr(skb)->h_source, vxlan->dev->dev_addr))
  1186			goto drop;
  1187	
  1188		/* Ignore packets from invalid src-address */
  1189		if (!is_valid_ether_addr(eth_hdr(skb)->h_source))
> 1190			return false;
  1191	
  1192		/* Get data from the outer IP header */
  1193		if (vxlan_get_sk_family(vs) == AF_INET) {
  1194			oip = ip_hdr(skb);
  1195			saddr.sin.sin_addr.s_addr = oip->saddr;
  1196			saddr.sa.sa_family = AF_INET;
  1197	#if IS_ENABLED(CONFIG_IPV6)
  1198		} else {
  1199			oip6 = ipv6_hdr(skb);
  1200			saddr.sin6.sin6_addr = oip6->saddr;
  1201			saddr.sa.sa_family = AF_INET6;
  1202	#endif
  1203		}
  1204	
  1205		if (tun_dst) {
  1206			skb_dst_set(skb, (struct dst_entry *)tun_dst);
  1207			tun_dst = NULL;
  1208		}
  1209	
  1210		if ((vxlan->flags & VXLAN_F_LEARN) &&
  1211		    vxlan_snoop(skb->dev, &saddr, eth_hdr(skb)->h_source))
  1212			goto drop;
  1213	
  1214		skb_reset_network_header(skb);
  1215		/* In flow-based mode, GBP is carried in dst_metadata */
  1216		if (!(vs->flags & VXLAN_F_COLLECT_METADATA))
  1217			skb->mark = md->gbp;
  1218	
  1219		if (oip6)
  1220			err = IP6_ECN_decapsulate(oip6, skb);
  1221		if (oip)
  1222			err = IP_ECN_decapsulate(oip, skb);
  1223	
  1224		if (unlikely(err)) {
  1225			if (log_ecn_error) {
  1226				if (oip6)
  1227					net_info_ratelimited("non-ECT from %pI6\n",
  1228							     &oip6->saddr);
  1229				if (oip)
  1230					net_info_ratelimited("non-ECT from %pI4 with TOS=%#x\n",
  1231							     &oip->saddr, oip->tos);
  1232			}
  1233			if (err > 1) {
  1234				++vxlan->dev->stats.rx_frame_errors;
  1235				++vxlan->dev->stats.rx_errors;
  1236				goto drop;
  1237			}
  1238		}
  1239	
  1240		rcu_read_lock();
  1241	
  1242		if (unlikely(!(vxlan->dev->flags & IFF_UP))) {
  1243			rcu_read_unlock();
  1244			atomic_long_inc(&vxlan->dev->rx_dropped);
  1245			goto drop;
  1246		}
  1247	
  1248		stats = this_cpu_ptr(vxlan->dev->tstats);
  1249		u64_stats_update_begin(&stats->syncp);
  1250		stats->rx_packets++;
  1251		stats->rx_bytes += skb->len;
  1252		u64_stats_update_end(&stats->syncp);
  1253	
  1254		gro_cells_receive(&vxlan->gro_cells, skb);
  1255	
  1256		rcu_read_unlock();
  1257	
  1258		return;
  1259	drop:
  1260		if (tun_dst)
  1261			dst_release((struct dst_entry *)tun_dst);
  1262	
  1263		/* Consume bad packet */
  1264		kfree_skb(skb);
  1265	}
  1266	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
