Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61801E3DF2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 08:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736326066; cv=none; b=L2gotO791Jy0U3Rx3cRRvp5h801TJC8YW8ciSb4QRcc5T2PWHM9fdwWRFjyutax6uCF7p18pVv61dF9l07XukUL1ph56Tt+FRsqZ8RA6wY6gFmpnOqw9ScmpT2zvTUqY44X8z1f9P5r349w72eamQrGgjd3QUaSh87ngUo6ubMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736326066; c=relaxed/simple;
	bh=ym4giNOjD5KBSuDq2VZlC/UuCgby3GS27YW5CKAyKtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X9t+0b+NoeUnHsnHlucg/cXnIlUA7yCecImV5T5oUCC/dWcY/GH0P6ZvNX1c9AQHi4tDyz4kQUtPqyFtyaYaCYV1aLLJT3OMElMbxdiIsa6IL+Xoj34npSPJuWzNPt8nwDVusdu0SeKDA2wLvfGLagUd2oiJ3/pWjMry5tdjKB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LMTmD2UE; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LMTmD2UE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736326065; x=1767862065;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ym4giNOjD5KBSuDq2VZlC/UuCgby3GS27YW5CKAyKtc=;
  b=LMTmD2UEuZzf4hH2+LOD/1TU0PzbwllwHS/Dw45g102yerON01p2ClMo
   rx2s891D+Z/Z0QdFHxC1ubcWGZxOMvkPnjlyGwrCELUZKrXqM5lw1zgLq
   J+2emmNoZz+KasbIbz1CCupfpY1K4p/XOi7kuV9jZ+2wiC2HyoO9Z6D+o
   fnBm6/3QaRSYTlJlxdy7V+1f6aeW2TuQ0AWQhIbABBC7w6+6Zb98xMDkj
   x+7htQEFITZDV0uEWgRYI5sYD6zvXuVmu189L2y1+0ABfgPtl1boTqrJ9
   qrwToV9TiodJdJy1s4uRZpAIPLtNWdUxx/jltWFObsVvYtwfntrwAb5lC
   Q==;
X-CSE-ConnectionGUID: 4QfyLphYQG+guRoXHrgmzg==
X-CSE-MsgGUID: A+aA3mZDQuuKF/v0h2ie0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36425848"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="36425848"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 00:47:44 -0800
X-CSE-ConnectionGUID: k7REskNVTzykR9OfCBOYYA==
X-CSE-MsgGUID: pGyOrzrGT92CCT5aj16bOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="103533675"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Jan 2025 00:47:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVRj2-000FpD-1Y;
	Wed, 08 Jan 2025 08:47:40 +0000
Date: Wed, 8 Jan 2025 16:46:48 +0800
From: kernel test robot <lkp@intel.com>
To: Chengen Du <chengen.du@canonical.com>, pjones@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, konrad@kernel.org,
	linux-kernel@vger.kernel.org, Chengen Du <chengen.du@canonical.com>
Subject: Re: [PATCH RESEND] iscsi_ibft: Fix UBSAN shift-out-of-bounds warning
 in ibft_attr_show_nic()
Message-ID: <202501081604.SgFiMXxU-lkp@intel.com>
References: <20250106043415.1966355-1-chengen.du@canonical.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106043415.1966355-1-chengen.du@canonical.com>

Hi Chengen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.13-rc6 next-20250107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chengen-Du/iscsi_ibft-Fix-UBSAN-shift-out-of-bounds-warning-in-ibft_attr_show_nic/20250106-123816
base:   linus/master
patch link:    https://lore.kernel.org/r/20250106043415.1966355-1-chengen.du%40canonical.com
patch subject: [PATCH RESEND] iscsi_ibft: Fix UBSAN shift-out-of-bounds warning in ibft_attr_show_nic()
config: i386-randconfig-061-20250108 (https://download.01.org/0day-ci/archive/20250108/202501081604.SgFiMXxU-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501081604.SgFiMXxU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501081604.SgFiMXxU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/iscsi_ibft.c:314:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] val @@     got int @@
   drivers/firmware/iscsi_ibft.c:314:29: sparse:     expected restricted __be32 [usertype] val
   drivers/firmware/iscsi_ibft.c:314:29: sparse:     got int

vim +314 drivers/firmware/iscsi_ibft.c

   290	
   291	static ssize_t ibft_attr_show_nic(void *data, int type, char *buf)
   292	{
   293		struct ibft_kobject *entry = data;
   294		struct ibft_nic *nic = entry->nic;
   295		void *ibft_loc = entry->header;
   296		char *str = buf;
   297		__be32 val;
   298	
   299		if (!nic)
   300			return 0;
   301	
   302		switch (type) {
   303		case ISCSI_BOOT_ETH_INDEX:
   304			str += sprintf(str, "%d\n", nic->hdr.index);
   305			break;
   306		case ISCSI_BOOT_ETH_FLAGS:
   307			str += sprintf(str, "%d\n", nic->hdr.flags);
   308			break;
   309		case ISCSI_BOOT_ETH_IP_ADDR:
   310			str += sprintf_ipaddr(str, nic->ip_addr);
   311			break;
   312		case ISCSI_BOOT_ETH_SUBNET_MASK:
   313			if (nic->subnet_mask_prefix > 32)
 > 314				val = ~0;
   315			else
   316				val = cpu_to_be32(~((1 << (32-nic->subnet_mask_prefix))-1));
   317			str += sprintf(str, "%pI4", &val);
   318			break;
   319		case ISCSI_BOOT_ETH_PREFIX_LEN:
   320			str += sprintf(str, "%d\n", nic->subnet_mask_prefix);
   321			break;
   322		case ISCSI_BOOT_ETH_ORIGIN:
   323			str += sprintf(str, "%d\n", nic->origin);
   324			break;
   325		case ISCSI_BOOT_ETH_GATEWAY:
   326			str += sprintf_ipaddr(str, nic->gateway);
   327			break;
   328		case ISCSI_BOOT_ETH_PRIMARY_DNS:
   329			str += sprintf_ipaddr(str, nic->primary_dns);
   330			break;
   331		case ISCSI_BOOT_ETH_SECONDARY_DNS:
   332			str += sprintf_ipaddr(str, nic->secondary_dns);
   333			break;
   334		case ISCSI_BOOT_ETH_DHCP:
   335			str += sprintf_ipaddr(str, nic->dhcp);
   336			break;
   337		case ISCSI_BOOT_ETH_VLAN:
   338			str += sprintf(str, "%d\n", nic->vlan);
   339			break;
   340		case ISCSI_BOOT_ETH_MAC:
   341			str += sprintf(str, "%pM\n", nic->mac);
   342			break;
   343		case ISCSI_BOOT_ETH_HOSTNAME:
   344			str += sprintf_string(str, nic->hostname_len,
   345					      (char *)ibft_loc + nic->hostname_off);
   346			break;
   347		default:
   348			break;
   349		}
   350	
   351		return str - buf;
   352	};
   353	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
