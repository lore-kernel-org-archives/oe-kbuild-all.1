Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3219ED6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Oct 2023 10:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nxkQe/Ai"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698746518; x=1730282518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DfsChj699Iu7g+nzYkZeP/3TfkdMVTrTwYVJB9Ej9c4=;
  b=nxkQe/AiEjEncRZWwzq1OjLGfmdIIy4vuzad5gWqLGnA+jqv4SyB5WSo
   vr2g9eyueDZT1LEkeWrS4ipc86eC/vPtec07BjtsEmoU0mivfKpVAxyTr
   ExWBT0GMd9t9T6k4h8NOMBg5qczXpRk1rdjUzQ7OcbPjRUAJUPVAPlUOQ
   0EM/k7iw23gLEUkNtSGWB+LovDnZYZKVKmZ+b94kij1xdKiBdPxZvwbKx
   sIkcMbQVXtCCya0Fr+phD5z6ygsRv4sm3dV2W0nrRCtSFgQ4Txdjte7+2
   bphDrtm9UXU2uofM35GMAzw0ioe9Ew9+xJlV64qmsjOVB+PzAwqet7HXm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="1101834"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="1101834"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 03:01:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="710378888"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="710378888"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 31 Oct 2023 03:01:55 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxlZJ-000067-1f;
	Tue, 31 Oct 2023 10:01:53 +0000
Date: Tue, 31 Oct 2023 18:01:49 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_and_bit 19/49] arch/sparc/kernel/pci_msi.c:101:25:
 error: 'struct pci_pbm_info' has no member named 'msk_num'; did you mean
 'msi_num'?
Message-ID: <202310311745.Dt9172ou-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find_and_bit
head:   44c7dd507a16503002a00d52658fcdbaa1a20e4d
commit: 97304b995261d6a0705bb9ee4a026329f8dfaa5f [19/49] sparc: fix opencoded find_and_set_bit() in alloc_msi()
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20231031/202310311745.Dt9172ou-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310311745.Dt9172ou-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310311745.Dt9172ou-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/sparc/kernel/pci_msi.c: In function 'alloc_msi':
>> arch/sparc/kernel/pci_msi.c:101:25: error: 'struct pci_pbm_info' has no member named 'msk_num'; did you mean 'msi_num'?
     101 |         return i < pbm->msk_num ? i + pbm->msi_first : -ENOENT;
         |                         ^~~~~~~
         |                         msi_num
>> arch/sparc/kernel/pci_msi.c:102:1: error: control reaches end of non-void function [-Werror=return-type]
     102 | }
         | ^
   cc1: all warnings being treated as errors


vim +101 arch/sparc/kernel/pci_msi.c

    95	
    96	
    97	static int alloc_msi(struct pci_pbm_info *pbm)
    98	{
    99		int i = find_and_set_bit(pbm->msi_bitmap, pbm->msi_num);
   100	
 > 101		return i < pbm->msk_num ? i + pbm->msi_first : -ENOENT;
 > 102	}
   103	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
