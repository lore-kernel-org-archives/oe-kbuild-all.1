Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792826260;
	b=s+AEzDJm1nam0nrNvKVxvzceowyhbn7Z4eeFicnSsSA3NylBjUWDB1Dr2vqm5WUsqaUu
	 pbd7LC+p4HUW+6RUnI9dWLm7gobH7OdVVLtlfsDykIhNnaeQ9iOGNMccpLa+fy1mzF8D2
	 GP+TAEEvEhkiuWRiextOpi989Wtqp1ENpvbQZT4sqHe/AxO/IaG8vXdCsTl7MQanbqH2h
	 znZiZGifZCddhD7MOVRzbhVIT7lUqrI98jpAI6+hx+wUThrSgNXNrZNJ0GtI4Q2lho5fl
	 ncq6WYKqEsAQBpI9DB3gngdmHqEQfcH4xIQ5v3YlrmAN4VZParKixjtmW+L7r4hoFnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792826260;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=JPvbwl0uvLYjRLKiInKA+c00FV5xGWQ4S8sPsoXMElA=;
	b=nurhpHB4Lr8TWVW/EQgDB3dUEcc+VP4EB+lnXcTxGfvLyggi8dSVvQm1G76rkptn7wmB
	 K6rzPhhW0FjFSlNDoijaFMxGqaK0nO5aqcWPg9Qz6N6ByrrztPvgPxpBOMCkJhuN3281N
	 kZTF7q4kI/qHTIZ3vuh6GzmBQCqzZlKoiEEO3wPz7ogmRGxybsKUagEmo8EgBDXhVgTaQ
	 DH6zPnXimnvCQRBb6c09F/WmuBsUGunhJwvu3DpUuledOFQL2EkYMx6UjXfsglnHpPj+T
	 6VwiPP7t1xfx81My544GzPNlwNGgCfyJIlvmgMJTPJeV2j1xQGYMTJOC5Uqizjd7aPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IMImyPk2;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F233606A323
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Oct 2026 07:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F233606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IMImyPk2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792826258; x=1824362258;
  h=date:from:to:cc:subject:message-id;
  bh=CDcjAtoQrmRT0I9ZXQk+iluxjd1RmeM2AVQNsJjQWD4=;
  b=IMImyPk2jmf0Mc3jBQznU71bkv+Yf7KKdQs29FTQxJ8/Sj98yA1d4da5
   Rn6FK/ybfkTSXKZ7zdy04oXpERvlHG0WT8oV/xlvVdC6+c6famFWnL5UU
   SeCEYFIdrjYRqPYbWXMKDMM5wXPoy/rr1PCE6hfFKuOshNiPy/gcnPzWt
   V7vMX119psww2ACZsaOMUhwX7RQXhG5u+U6y9uJpCWLfLwycOtib/DXHY
   cvfAWbpdOwBKG8xPj5wIJsJT89MVledbK+Wy+MmsMgIVhwj+WHlrvanA1
   EX17G+ncFNTJ9LxBOh6wyG4TzB7NkN0jAYeZW85QW7rNHhsQ6guCi8CMI
   A==;
X-CSE-ConnectionGUID: hSiLZdHORhmLujRPbfW44w==
X-CSE-MsgGUID: jLiBbZ+IQfS12wsBjiEyPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1450348"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1450348"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 00:17:38 -0700
X-CSE-ConnectionGUID: qCNd5RO/TQmXH1gclFamyA==
X-CSE-MsgGUID: cAxzFof0RDKny/OcITt5lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="3750961"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 24 Oct 2026 00:17:36 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKW0U-000000003KN-2f1h;
	Sat, 24 Oct 2026 07:17:34 +0000
Date: Sat, 24 Oct 2026 09:17:31 +0200
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 19621/19841]
 arch/loongarch/pci/pci.c:47:10: warning: shift count >= width of type
Message-ID: <202610240921.rxXxjiK4-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   20a33c6b6cbe7e4805dfb6cd68816937443aa148
commit: 8bb068a4a74510c3609ebb9ca2448c0c3d4fd8b6 [19621/19841] LoongArch: Use pa_to_nid()/nid_to_addrbase() rather than hard-code
config: loongarch-randconfig-r2311-20261023 (https://download.01.org/0day-ci/archive/20261024/202610240921.rxXxjiK4-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a808f8ea7fdc61ead417bfe55e8ef5f728776aeb)
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610240921.rxXxjiK4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610240921.rxXxjiK4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/loongarch/pci/pci.c:47:10: warning: shift count >= width of type [-Wshift-count-overflow]
      47 |         return (nid_to_addrbase(node) | MCFG_EXT_PCICFG_BASE);
         |                 ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/include/asm/numa.h:17:45: note: expanded from macro 'nid_to_addrbase'
      17 | #define nid_to_addrbase(nid)    (_ULCAST_(nid) << NODE_ADDRSPACE_SHIFT)
         |                                                ^  ~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +47 arch/loongarch/pci/pci.c

    44	
    45	phys_addr_t mcfg_addr_init(int node)
    46	{
  > 47		return (nid_to_addrbase(node) | MCFG_EXT_PCICFG_BASE);
    48	}
    49	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
