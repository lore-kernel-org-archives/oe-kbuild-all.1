Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFD9275846
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 13:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751464709; cv=none; b=pRUGGHp5KGYBGuNeXHTrXSSYIuxO0V+GcQdeunzRCj+fqYqS9cmFxoe6SDz24gLub4WEpzaOTekhnIh0t9M6rMGbOG+P7I9OJtuW0NSc6tk0K94Zo7y+InkMM/HjYzh/ry3Pytgg/yvLwqSnNxBcA/iSe5bPEvvmK+rOuT8HAv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751464709; c=relaxed/simple;
	bh=cNi6zXtUqDAz9I7/3FrKUe2xS7369M5D+D+rRSyNc7o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L/YWijvGEipWmZqEWgzFTZdt9HZ5Fa8hsKc37JL2tcILdzbeMLJs4AYM7Q6oJTmD4zPc5PanjxiX3jPZu23HIyF1Tuf++bU/iTB3OMN94aSwEC3mL/N3PcMYafUFuPAiSBdsHLlRFSVF/11hl6Ckwyl8bVmQ/MCAty6k2BaYJiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VwhSlStr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VwhSlStr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751464707; x=1783000707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cNi6zXtUqDAz9I7/3FrKUe2xS7369M5D+D+rRSyNc7o=;
  b=VwhSlStrh8eItNDq4C3f8K54UU9X8gDOlnqobLlR5MwEvaTkJ2LJKisf
   2TdsQmRYwpeOlqkQM2TY5G1lW4Eod5QlSjn+FBy5XfiAsfk8Yz2celyGS
   iiPbKXa8vGcQ9vufRQv2AR9LaadV0R+fQOu9cmIvjIT8YPoafl2YqwNSx
   mtSa9u/GlWrEDj2A1RPO3YuPd28jR4HTA63HxM8mAib2juyJ9pxlkyhJb
   fTb2dMzkipE05WQOd6jj/9UvdT2IcGs11FV7Xqth0nfMSrFwlCL/Wt2Fx
   BKa3VkJAxeMU7C0WPxTF01EzjT602tOS4anpn2hseCb2wWn0tDOgVyzPV
   g==;
X-CSE-ConnectionGUID: RclIPkLmTkSFuemrkBackw==
X-CSE-MsgGUID: Tr8NXHoxQNGiukMRsYjiPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53689602"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="53689602"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 06:58:26 -0700
X-CSE-ConnectionGUID: SjQQGwB7Q62IM68p2EL3AQ==
X-CSE-MsgGUID: R3BpDnmfRGC7hbeEIFaPIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="185028639"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Jul 2025 06:58:20 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWxyb-0000hd-2E;
	Wed, 02 Jul 2025 13:58:17 +0000
Date: Wed, 2 Jul 2025 21:57:36 +0800
From: kernel test robot <lkp@intel.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thesofproject:topic/sof-dev 7944/8060] mtk-adsp-common.c:undefined
 reference to `mtk_adsp_ipc_send'
Message-ID: <202507022143.ro0QYKxv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   d4313480bac60ae98ed8142fa7d30d62854c1b87
commit: 5d1ad0198aca9adc1252497092b7c20ed3b72d45 [7944/8060] Merge branch 'sound/upstream-20250619' into merge/sound-upstream-20250619
config: um-randconfig-r054-20250702 (https://download.01.org/0day-ci/archive/20250702/202507022143.ro0QYKxv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507022143.ro0QYKxv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507022143.ro0QYKxv-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: sound/soc/sof/mediatek/mtk-adsp-common.o: in function `mtk_adsp_send_msg':
>> mtk-adsp-common.c:(.text+0x51): undefined reference to `mtk_adsp_ipc_send'
   /usr/bin/ld: sound/soc/sof/mediatek/mtk-adsp-common.o: in function `mtk_adsp_handle_request':
   mtk-adsp-common.c:(.text+0x12b): undefined reference to `mtk_adsp_ipc_send'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
