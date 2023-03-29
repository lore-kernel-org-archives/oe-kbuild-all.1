Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594244437
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 16:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680108850; x=1711644850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ug/fdM2J30LXbYQqdpRYo0qZZTYxeRaiamr8MackJa0=;
  b=B8LIn2Nu+uKaKnaPrbOG9eWl+HEt8RefcQE9WiNV1ay9Y0pR6GsfY+87
   fWEK8X4f6Zy84OnLJEr105o1fnTEM0+NmEkcJHs0HttzNkywUf9Q/Xc1x
   So67VUiu2QUbr7D11IHkb3dLHRC5wFkiSgSytpgRdvrx5Amo7uUFBeTWI
   U2AAgwq6bMUlQBGvOqroxNOk/TiXn+2hTo0k4aaQSvVcwNUaT2YMThu5C
   h6xI7XVUKRH8uS+MIS6HJXPzRswcUCCCNUKIfDKUTDxcVCXKQncbbIc5K
   z5a0zfm7/uBFqf9lpo/1y4t36jNesQhzmEFLKsicxQkTbzlWfV0kvs+m8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="338441430"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="338441430"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 09:54:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="930403121"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="930403121"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 29 Mar 2023 09:54:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phZ3h-000Jju-2h;
	Wed, 29 Mar 2023 16:54:01 +0000
Date: Thu, 30 Mar 2023 00:53:23 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-sendpage 31/63] net/ipv4/ip_output.c:1052:32:
 warning: unused variable 'msg'
Message-ID: <202303300035.2aOnYnjB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git iov-sendpage
head:   39e48c1301bf2fb60a53912fe5870a253256debc
commit: cceeda73094fa54bca7d98c0d8e1cbdd19a6d1ee [31/63] ip, udp: Support MSG_SPLICE_PAGES
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230330/202303300035.2aOnYnjB-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=cceeda73094fa54bca7d98c0d8e1cbdd19a6d1ee
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs iov-sendpage
        git checkout cceeda73094fa54bca7d98c0d8e1cbdd19a6d1ee
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/ipv4/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300035.2aOnYnjB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/ipv4/ip_output.c: In function '__ip_append_data':
>> net/ipv4/ip_output.c:1052:32: warning: unused variable 'msg' [-Wunused-variable]
    1052 |                 struct msghdr *msg = from;
         |                                ^~~


vim +/msg +1052 net/ipv4/ip_output.c

   958	
   959	static int __ip_append_data(struct sock *sk,
   960				    struct flowi4 *fl4,
   961				    struct sk_buff_head *queue,
   962				    struct inet_cork *cork,
   963				    struct page_frag *pfrag,
   964				    int getfrag(void *from, char *to, int offset,
   965						int len, int odd, struct sk_buff *skb),
   966				    void *from, int length, int transhdrlen,
   967				    unsigned int flags)
   968	{
   969		struct inet_sock *inet = inet_sk(sk);
   970		struct ubuf_info *uarg = NULL;
   971		struct sk_buff *skb;
   972		struct ip_options *opt = cork->opt;
   973		int hh_len;
   974		int exthdrlen;
   975		int mtu;
   976		ssize_t copy;
   977		int err;
   978		int offset = 0;
   979		bool zc = false;
   980		unsigned int maxfraglen, fragheaderlen, maxnonfragsize, xlength;
   981		int csummode = CHECKSUM_NONE;
   982		struct rtable *rt = (struct rtable *)cork->dst;
   983		unsigned int wmem_alloc_delta = 0;
   984		bool paged, extra_uref = false;
   985		u32 tskey = 0;
   986	
   987		skb = skb_peek_tail(queue);
   988	
   989		exthdrlen = !skb ? rt->dst.header_len : 0;
   990		mtu = cork->gso_size ? IP_MAX_MTU : cork->fragsize;
   991		paged = !!cork->gso_size;
   992	
   993		if (cork->tx_flags & SKBTX_ANY_SW_TSTAMP &&
   994		    sk->sk_tsflags & SOF_TIMESTAMPING_OPT_ID)
   995			tskey = atomic_inc_return(&sk->sk_tskey) - 1;
   996	
   997		hh_len = LL_RESERVED_SPACE(rt->dst.dev);
   998	
   999		fragheaderlen = sizeof(struct iphdr) + (opt ? opt->optlen : 0);
  1000		maxfraglen = ((mtu - fragheaderlen) & ~7) + fragheaderlen;
  1001		maxnonfragsize = ip_sk_ignore_df(sk) ? IP_MAX_MTU : mtu;
  1002	
  1003		if (cork->length + length > maxnonfragsize - fragheaderlen) {
  1004			ip_local_error(sk, EMSGSIZE, fl4->daddr, inet->inet_dport,
  1005				       mtu - (opt ? opt->optlen : 0));
  1006			return -EMSGSIZE;
  1007		}
  1008	
  1009		/*
  1010		 * transhdrlen > 0 means that this is the first fragment and we wish
  1011		 * it won't be fragmented in the future.
  1012		 */
  1013		if (transhdrlen &&
  1014		    length + fragheaderlen <= mtu &&
  1015		    rt->dst.dev->features & (NETIF_F_HW_CSUM | NETIF_F_IP_CSUM) &&
  1016		    (!(flags & MSG_MORE) || cork->gso_size) &&
  1017		    (!exthdrlen || (rt->dst.dev->features & NETIF_F_HW_ESP_TX_CSUM)))
  1018			csummode = CHECKSUM_PARTIAL;
  1019	
  1020		xlength = length;
  1021		if ((flags & MSG_ZEROCOPY) && length) {
  1022			struct msghdr *msg = from;
  1023	
  1024			if (getfrag == ip_generic_getfrag && msg->msg_ubuf) {
  1025				if (skb_zcopy(skb) && msg->msg_ubuf != skb_zcopy(skb))
  1026					return -EINVAL;
  1027	
  1028				/* Leave uarg NULL if can't zerocopy, callers should
  1029				 * be able to handle it.
  1030				 */
  1031				if ((rt->dst.dev->features & NETIF_F_SG) &&
  1032				    csummode == CHECKSUM_PARTIAL) {
  1033					paged = true;
  1034					zc = true;
  1035					uarg = msg->msg_ubuf;
  1036				}
  1037			} else if (sock_flag(sk, SOCK_ZEROCOPY)) {
  1038				uarg = msg_zerocopy_realloc(sk, length, skb_zcopy(skb));
  1039				if (!uarg)
  1040					return -ENOBUFS;
  1041				extra_uref = !skb_zcopy(skb);	/* only ref on new uarg */
  1042				if (rt->dst.dev->features & NETIF_F_SG &&
  1043				    csummode == CHECKSUM_PARTIAL) {
  1044					paged = true;
  1045					zc = true;
  1046				} else {
  1047					uarg_to_msgzc(uarg)->zerocopy = 0;
  1048					skb_zcopy_set(skb, uarg, &extra_uref);
  1049				}
  1050			}
  1051		} else if ((flags & MSG_SPLICE_PAGES) && length) {
> 1052			struct msghdr *msg = from;
  1053	
  1054			if (inet->hdrincl)
  1055				return -EPERM;
  1056			if (!(rt->dst.dev->features & NETIF_F_SG))
  1057				return -EOPNOTSUPP;
  1058			xlength = transhdrlen; /* We need an empty buffer to attach stuff to */
  1059		}
  1060	
  1061		cork->length += length;
  1062	
  1063		/* So, what's going on in the loop below?
  1064		 *
  1065		 * We use calculated fragment length to generate chained skb,
  1066		 * each of segments is IP fragment ready for sending to network after
  1067		 * adding appropriate IP header.
  1068		 */
  1069	
  1070		if (!skb)
  1071			goto alloc_new_skb;
  1072	
  1073		while (length > 0) {
  1074			/* Check if the remaining data fits into current packet. */
  1075			copy = mtu - skb->len;
  1076			if (copy < length)
  1077				copy = maxfraglen - skb->len;
  1078			if (copy <= 0) {
  1079				char *data;
  1080				unsigned int datalen;
  1081				unsigned int fraglen;
  1082				unsigned int fraggap;
  1083				unsigned int alloclen, alloc_extra;
  1084				unsigned int pagedlen;
  1085				struct sk_buff *skb_prev;
  1086	
  1087				if (unlikely(flags & MSG_SPLICE_PAGES)) {
  1088					skb_prev = skb;
  1089					fraggap = skb_prev->len - maxfraglen;
  1090	
  1091					alloclen = fragheaderlen + hh_len + fraggap + 15;
  1092					skb = sock_wmalloc(sk, alloclen, 1, sk->sk_allocation);
  1093					if (unlikely(!skb)) {
  1094						err = -ENOBUFS;
  1095						goto error;
  1096					}
  1097	
  1098					/*
  1099					 *	Fill in the control structures
  1100					 */
  1101					skb->ip_summed = CHECKSUM_NONE;
  1102					skb->csum = 0;
  1103					skb_reserve(skb, hh_len);
  1104	
  1105					/*
  1106					 *	Find where to start putting bytes.
  1107					 */
  1108					skb_put(skb, fragheaderlen + fraggap);
  1109					skb_reset_network_header(skb);
  1110					skb->transport_header = (skb->network_header +
  1111								 fragheaderlen);
  1112					if (fraggap) {
  1113						skb->csum = skb_copy_and_csum_bits(
  1114							skb_prev, maxfraglen,
  1115							skb_transport_header(skb),
  1116							fraggap);
  1117						skb_prev->csum = csum_sub(skb_prev->csum,
  1118									  skb->csum);
  1119						pskb_trim_unique(skb_prev, maxfraglen);
  1120					}
  1121	
  1122					/*
  1123					 * Put the packet on the pending queue.
  1124					 */
  1125					__skb_queue_tail(&sk->sk_write_queue, skb);
  1126					continue;
  1127				}
  1128				xlength = length;
  1129	
  1130	alloc_new_skb:
  1131				skb_prev = skb;
  1132				if (skb_prev)
  1133					fraggap = skb_prev->len - maxfraglen;
  1134				else
  1135					fraggap = 0;
  1136	
  1137				/*
  1138				 * If remaining data exceeds the mtu,
  1139				 * we know we need more fragment(s).
  1140				 */
  1141				datalen = xlength + fraggap;
  1142				if (datalen > mtu - fragheaderlen)
  1143					datalen = maxfraglen - fragheaderlen;
  1144				fraglen = datalen + fragheaderlen;
  1145				pagedlen = 0;
  1146	
  1147				alloc_extra = hh_len + 15;
  1148				alloc_extra += exthdrlen;
  1149	
  1150				/* The last fragment gets additional space at tail.
  1151				 * Note, with MSG_MORE we overallocate on fragments,
  1152				 * because we have no idea what fragment will be
  1153				 * the last.
  1154				 */
  1155				if (datalen == xlength + fraggap)
  1156					alloc_extra += rt->dst.trailer_len;
  1157	
  1158				if ((flags & MSG_MORE) &&
  1159				    !(rt->dst.dev->features&NETIF_F_SG))
  1160					alloclen = mtu;
  1161				else if (!paged &&
  1162					 (fraglen + alloc_extra < SKB_MAX_ALLOC ||
  1163					  !(rt->dst.dev->features & NETIF_F_SG)))
  1164					alloclen = fraglen;
  1165				else {
  1166					alloclen = fragheaderlen + transhdrlen;
  1167					pagedlen = datalen - transhdrlen;
  1168				}
  1169	
  1170				alloclen += alloc_extra;
  1171	
  1172				if (transhdrlen) {
  1173					skb = sock_alloc_send_skb(sk, alloclen,
  1174							(flags & MSG_DONTWAIT), &err);
  1175				} else {
  1176					skb = NULL;
  1177					if (refcount_read(&sk->sk_wmem_alloc) + wmem_alloc_delta <=
  1178					    2 * sk->sk_sndbuf)
  1179						skb = alloc_skb(alloclen,
  1180								sk->sk_allocation);
  1181					if (unlikely(!skb))
  1182						err = -ENOBUFS;
  1183				}
  1184				if (!skb)
  1185					goto error;
  1186	
  1187				/*
  1188				 *	Fill in the control structures
  1189				 */
  1190				skb->ip_summed = csummode;
  1191				skb->csum = 0;
  1192				skb_reserve(skb, hh_len);
  1193	
  1194				/*
  1195				 *	Find where to start putting bytes.
  1196				 */
  1197				data = skb_put(skb, fraglen + exthdrlen - pagedlen);
  1198				skb_set_network_header(skb, exthdrlen);
  1199				skb->transport_header = (skb->network_header +
  1200							 fragheaderlen);
  1201				data += fragheaderlen + exthdrlen;
  1202	
  1203				if (fraggap) {
  1204					skb->csum = skb_copy_and_csum_bits(
  1205						skb_prev, maxfraglen,
  1206						data + transhdrlen, fraggap);
  1207					skb_prev->csum = csum_sub(skb_prev->csum,
  1208								  skb->csum);
  1209					data += fraggap;
  1210					pskb_trim_unique(skb_prev, maxfraglen);
  1211				}
  1212	
  1213				copy = datalen - transhdrlen - fraggap - pagedlen;
  1214				if (copy > 0 && getfrag(from, data + transhdrlen, offset, copy, fraggap, skb) < 0) {
  1215					err = -EFAULT;
  1216					kfree_skb(skb);
  1217					goto error;
  1218				}
  1219	
  1220				offset += copy;
  1221				length -= copy + transhdrlen;
  1222				transhdrlen = 0;
  1223				exthdrlen = 0;
  1224				csummode = CHECKSUM_NONE;
  1225	
  1226				/* only the initial fragment is time stamped */
  1227				skb_shinfo(skb)->tx_flags = cork->tx_flags;
  1228				cork->tx_flags = 0;
  1229				skb_shinfo(skb)->tskey = tskey;
  1230				tskey = 0;
  1231				skb_zcopy_set(skb, uarg, &extra_uref);
  1232	
  1233				if ((flags & MSG_CONFIRM) && !skb_prev)
  1234					skb_set_dst_pending_confirm(skb, 1);
  1235	
  1236				/*
  1237				 * Put the packet on the pending queue.
  1238				 */
  1239				if (!skb->destructor) {
  1240					skb->destructor = sock_wfree;
  1241					skb->sk = sk;
  1242					wmem_alloc_delta += skb->truesize;
  1243				}
  1244				__skb_queue_tail(queue, skb);
  1245				continue;
  1246			}
  1247	
  1248			if (copy > length)
  1249				copy = length;
  1250	
  1251			if (!(rt->dst.dev->features&NETIF_F_SG) &&
  1252			    skb_tailroom(skb) >= copy) {
  1253				unsigned int off;
  1254	
  1255				off = skb->len;
  1256				if (getfrag(from, skb_put(skb, copy),
  1257						offset, copy, off, skb) < 0) {
  1258					__skb_trim(skb, off);
  1259					err = -EFAULT;
  1260					goto error;
  1261				}
  1262			} else if (flags & MSG_SPLICE_PAGES) {
  1263				struct msghdr *msg = from;
  1264				struct page *page = NULL, **pages = &page;
  1265				size_t off;
  1266	
  1267				copy = iov_iter_extract_pages(&msg->msg_iter, &pages,
  1268							      copy, 1, 0, &off);
  1269				if (copy <= 0) {
  1270					err = copy ?: -EIO;
  1271					goto error;
  1272				}
  1273	
  1274				err = skb_append_pagefrags(skb, page, off, copy);
  1275				if (err < 0)
  1276					goto error;
  1277	
  1278				if (skb->ip_summed == CHECKSUM_NONE) {
  1279					__wsum csum;
  1280					csum = csum_page(page, off, copy);
  1281					skb->csum = csum_block_add(skb->csum, csum, skb->len);
  1282				}
  1283	
  1284				skb_len_add(skb, copy);
  1285				refcount_add(copy, &sk->sk_wmem_alloc);
  1286			} else if (!zc) {
  1287				int i = skb_shinfo(skb)->nr_frags;
  1288	
  1289				err = -ENOMEM;
  1290				if (!sk_page_frag_refill(sk, pfrag))
  1291					goto error;
  1292	
  1293				skb_zcopy_downgrade_managed(skb);
  1294				if (!skb_can_coalesce(skb, i, pfrag->page,
  1295						      pfrag->offset)) {
  1296					err = -EMSGSIZE;
  1297					if (i == MAX_SKB_FRAGS)
  1298						goto error;
  1299	
  1300					__skb_fill_page_desc(skb, i, pfrag->page,
  1301							     pfrag->offset, 0);
  1302					skb_shinfo(skb)->nr_frags = ++i;
  1303					get_page(pfrag->page);
  1304				}
  1305				copy = min_t(int, copy, pfrag->size - pfrag->offset);
  1306				if (getfrag(from,
  1307					    page_address(pfrag->page) + pfrag->offset,
  1308					    offset, copy, skb->len, skb) < 0)
  1309					goto error_efault;
  1310	
  1311				pfrag->offset += copy;
  1312				skb_frag_size_add(&skb_shinfo(skb)->frags[i - 1], copy);
  1313				skb_len_add(skb, copy);
  1314				wmem_alloc_delta += copy;
  1315			} else {
  1316				err = skb_zerocopy_iter_dgram(skb, from, copy);
  1317				if (err < 0)
  1318					goto error;
  1319			}
  1320			offset += copy;
  1321			length -= copy;
  1322		}
  1323	
  1324		if (wmem_alloc_delta)
  1325			refcount_add(wmem_alloc_delta, &sk->sk_wmem_alloc);
  1326		return 0;
  1327	
  1328	error_efault:
  1329		err = -EFAULT;
  1330	error:
  1331		net_zcopy_put_abort(uarg, extra_uref);
  1332		cork->length -= length;
  1333		IP_INC_STATS(sock_net(sk), IPSTATS_MIB_OUTDISCARDS);
  1334		refcount_add(wmem_alloc_delta, &sk->sk_wmem_alloc);
  1335		return err;
  1336	}
  1337	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
