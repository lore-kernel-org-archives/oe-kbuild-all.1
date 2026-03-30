Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997D03451A7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 15:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774884805; cv=none; b=TWxwrMhscnoFx7dvQdkpoDOmpv+EqYaEB/Ia3oI8IuTDxjjvu+CrRIcFBv5UrVfTmBZUU6A9mGBtVJYbHCw0xN+1qi2TUjIrEcoMeT1WrsJ8xXm2ODAXhI755NdjBnyTRCd4OkQHyQCncg12WTHwcyOBtjWb4Y+7cHaTGA42DkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774884805; c=relaxed/simple;
	bh=3pCnQQyLnj2/0y2ukadpmuu1vMIl/Vsy9ZebANfKljI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NILtPD0EPD37eTIeuidtyduEYIkrek94oe/ZfrEnXrt+a7fBIoTYNDPJUQPDeylkg7bQWHlfvSC9hDO4rBhNYyMTziBX06u2jHUyHMh5+SdmJTQG8Eg/ltnuDH0UkSkJRi0tSD1+mkKSff4eKO/t/p15il99ydZUva6iHd3Q4OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MTAEJDs+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MTAEJDs+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774884803; x=1806420803;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3pCnQQyLnj2/0y2ukadpmuu1vMIl/Vsy9ZebANfKljI=;
  b=MTAEJDs+eDjASyNOF23+NHWisyB52cUjUXUeB4sj2iOtLzAxQYpSXBxU
   16g1Fwqh/8dgjBDrbzGoASBPjtoJnzRWhXRDjqJMXHfAvb7VeabK/M20+
   DPZdI31EMOu/acArnMez637yPzytTOJVNUBiM7grJBIbl1tyQq5YWB0Ov
   EEfgTDXq8oFLzRvz96BT+ecNOcjHgoMVl3OOCovr38Dqi/REf+4/9jWtV
   lawQwgKUytJzejBYTRvkwrlB4ozKzjhT6z40nstGZBNHKxl66qkee8ORD
   GNKo7c691Rf2+W2PmyYJaERXCT6D2ias90lYRI2/C5PpHp8ZCNf7QJVgb
   g==;
X-CSE-ConnectionGUID: 8u7/Fvr5Q0uuCoVZiaV1Fg==
X-CSE-MsgGUID: jS5ArKCQSiaZrfizKGGvoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75945160"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="75945160"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 08:33:23 -0700
X-CSE-ConnectionGUID: d3Jjvgb9RoqsAu8jeD5xTA==
X-CSE-MsgGUID: cKHacYrpTYSxRa4lxbTN7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="256591284"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Mar 2026 08:33:20 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Ec8-000000001GX-1blC;
	Mon, 30 Mar 2026 15:33:16 +0000
Date: Mon, 30 Mar 2026 23:32:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kangzheng Gu <xiaoguai0992@gmail.com>, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, kees@kernel.org, thorsten.blum@linux.dev,
	arnd@arndb.de, sjur.brandeland@stericsson.com
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3] net: caif: fix stack out-of-bounds write in
 cfctrl_link_setup()
Message-ID: <202603302327.ZnK21mik-lkp@intel.com>
References: <20260329190350.19065-1-xiaoguai0992@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329190350.19065-1-xiaoguai0992@gmail.com>

Hi Kangzheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]
[also build test WARNING on net/main soc/for-next linus/master v7.0-rc6 next-20260327]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kangzheng-Gu/net-caif-fix-stack-out-of-bounds-write-in-cfctrl_link_setup/20260330-163130
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260329190350.19065-1-xiaoguai0992%40gmail.com
patch subject: [PATCH v3] net: caif: fix stack out-of-bounds write in cfctrl_link_setup()
config: um-randconfig-r073-20260330 (https://download.01.org/0day-ci/archive/20260330/202603302327.ZnK21mik-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603302327.ZnK21mik-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603302327.ZnK21mik-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/caif/cfctrl.c:423:6: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
     422 |                                 pr_warn("Request reject, volume name length exceeds %lu\n",
         |                                                                                     ~~~
         |                                                                                     %u
     423 |                                         sizeof(linkparam.u.rfm.volume));
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:564:37: note: expanded from macro 'pr_warn'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +423 net/caif/cfctrl.c

   351	
   352	static int cfctrl_link_setup(struct cfctrl *cfctrl, struct cfpkt *pkt, u8 cmdrsp)
   353	{
   354		u8 len;
   355		u8 linkid = 0;
   356		enum cfctrl_srv serv;
   357		enum cfctrl_srv servtype;
   358		u8 endpoint;
   359		u8 physlinkid;
   360		u8 prio;
   361		u8 tmp;
   362		u8 *cp;
   363		int i;
   364		struct cfctrl_link_param linkparam;
   365		struct cfctrl_request_info rsp, *req;
   366	
   367		memset(&linkparam, 0, sizeof(linkparam));
   368	
   369		tmp = cfpkt_extr_head_u8(pkt);
   370	
   371		serv = tmp & CFCTRL_SRV_MASK;
   372		linkparam.linktype = serv;
   373	
   374		servtype = tmp >> 4;
   375		linkparam.chtype = servtype;
   376	
   377		tmp = cfpkt_extr_head_u8(pkt);
   378		physlinkid = tmp & 0x07;
   379		prio = tmp >> 3;
   380	
   381		linkparam.priority = prio;
   382		linkparam.phyid = physlinkid;
   383		endpoint = cfpkt_extr_head_u8(pkt);
   384		linkparam.endpoint = endpoint & 0x03;
   385	
   386		switch (serv) {
   387		case CFCTRL_SRV_VEI:
   388		case CFCTRL_SRV_DBG:
   389			if (CFCTRL_ERR_BIT & cmdrsp)
   390				break;
   391			/* Link ID */
   392			linkid = cfpkt_extr_head_u8(pkt);
   393			break;
   394		case CFCTRL_SRV_VIDEO:
   395			tmp = cfpkt_extr_head_u8(pkt);
   396			linkparam.u.video.connid = tmp;
   397			if (CFCTRL_ERR_BIT & cmdrsp)
   398				break;
   399			/* Link ID */
   400			linkid = cfpkt_extr_head_u8(pkt);
   401			break;
   402	
   403		case CFCTRL_SRV_DATAGRAM:
   404			linkparam.u.datagram.connid = cfpkt_extr_head_u32(pkt);
   405			if (CFCTRL_ERR_BIT & cmdrsp)
   406				break;
   407			/* Link ID */
   408			linkid = cfpkt_extr_head_u8(pkt);
   409			break;
   410		case CFCTRL_SRV_RFM:
   411			/* Construct a frame, convert
   412			 * DatagramConnectionID
   413			 * to network format long and copy it out...
   414			 */
   415			linkparam.u.rfm.connid = cfpkt_extr_head_u32(pkt);
   416			cp = (u8 *) linkparam.u.rfm.volume;
   417			for (tmp = cfpkt_extr_head_u8(pkt);
   418			     cfpkt_more(pkt) && tmp != '\0';
   419			     tmp = cfpkt_extr_head_u8(pkt)) {
   420				if (cp >= (u8 *)linkparam.u.rfm.volume +
   421				    sizeof(linkparam.u.rfm.volume) - 1) {
   422					pr_warn("Request reject, volume name length exceeds %lu\n",
 > 423						sizeof(linkparam.u.rfm.volume));
   424					cmdrsp |= CFCTRL_ERR_BIT;
   425					break;
   426				}
   427				*cp++ = tmp;
   428			}
   429			*cp = '\0';
   430	
   431			if (CFCTRL_ERR_BIT & cmdrsp)
   432				break;
   433			/* Link ID */
   434			linkid = cfpkt_extr_head_u8(pkt);
   435	
   436			break;
   437		case CFCTRL_SRV_UTIL:
   438			/* Construct a frame, convert
   439			 * DatagramConnectionID
   440			 * to network format long and copy it out...
   441			 */
   442			/* Fifosize KB */
   443			linkparam.u.utility.fifosize_kb = cfpkt_extr_head_u16(pkt);
   444			/* Fifosize bufs */
   445			linkparam.u.utility.fifosize_bufs = cfpkt_extr_head_u16(pkt);
   446			/* name */
   447			cp = (u8 *) linkparam.u.utility.name;
   448			caif_assert(sizeof(linkparam.u.utility.name)
   449				     >= UTILITY_NAME_LENGTH);
   450			for (i = 0; i < UTILITY_NAME_LENGTH && cfpkt_more(pkt); i++) {
   451				tmp = cfpkt_extr_head_u8(pkt);
   452				*cp++ = tmp;
   453			}
   454			/* Length */
   455			len = cfpkt_extr_head_u8(pkt);
   456			linkparam.u.utility.paramlen = len;
   457			/* Param Data */
   458			cp = linkparam.u.utility.params;
   459			while (cfpkt_more(pkt) && len--) {
   460				tmp = cfpkt_extr_head_u8(pkt);
   461				*cp++ = tmp;
   462			}
   463			if (CFCTRL_ERR_BIT & cmdrsp)
   464				break;
   465			/* Link ID */
   466			linkid = cfpkt_extr_head_u8(pkt);
   467			/* Length */
   468			len = cfpkt_extr_head_u8(pkt);
   469			/* Param Data */
   470			cfpkt_extr_head(pkt, NULL, len);
   471			break;
   472		default:
   473			pr_warn("Request setup, invalid type (%d)\n", serv);
   474			return -1;
   475		}
   476	
   477		rsp.cmd = CFCTRL_CMD_LINK_SETUP;
   478		rsp.param = linkparam;
   479		spin_lock_bh(&cfctrl->info_list_lock);
   480		req = cfctrl_remove_req(cfctrl, &rsp);
   481	
   482		if (CFCTRL_ERR_BIT == (CFCTRL_ERR_BIT & cmdrsp) ||
   483			cfpkt_erroneous(pkt)) {
   484			pr_err("Invalid O/E bit or parse error "
   485					"on CAIF control channel\n");
   486			cfctrl->res.reject_rsp(cfctrl->serv.layer.up, 0,
   487					       req ? req->client_layer : NULL);
   488		} else {
   489			cfctrl->res.linksetup_rsp(cfctrl->serv.layer.up, linkid,
   490						  serv, physlinkid,
   491						  req ?  req->client_layer : NULL);
   492		}
   493	
   494		kfree(req);
   495	
   496		spin_unlock_bh(&cfctrl->info_list_lock);
   497	
   498		return 0;
   499	}
   500	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
