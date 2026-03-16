Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAAB370D55
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Mar 2026 23:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773704515; cv=none; b=GxGNMBrhuylWmw9nrdhsALvIyRoXoYaDS52JMBTt7aJ81pyo/TIWZ/YvD/O5mEwgOBKMP8A9gdKxxypeLlDNVYyvySfwVP12lEnmZ9aKHlhkzRmZ3LanWeMJ2WVf6AED07gdcBLQKRlsfWvxmnCWqdC6skMb5Exm/k/M0DvM9AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773704515; c=relaxed/simple;
	bh=JNYC20MGeEmyKvSEr1hjg83+2caKCG+sILiXazPJSiQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t3uLSpDs64br8Gy3ZXFmxQnWGdje8rIWlsVS8u6BwszfN0l+7OuHIqI09/95gz8fb5Z+Dga9GUEAooQrwUnoTIbgDXun57YFhcg05ACznHvpSG1TXmV0RFuH5LnEL9UMitzFJ4Viwhjq87MDu8W/PXFmggQNmYbQ9ibjkhT9gxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mbvbY5Ik; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mbvbY5Ik"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773704512; x=1805240512;
  h=date:from:to:cc:subject:message-id;
  bh=JNYC20MGeEmyKvSEr1hjg83+2caKCG+sILiXazPJSiQ=;
  b=mbvbY5IkRl1f9NnkkCZT7fU0zMLVCt2OIeJ/fqw8I4EJJ0/h84BySxba
   WTHcrNHk5iuvugNepavoN8DjbY8cfn4PxTRfJ2BuV7On/vbt/0Ys67ahw
   QNLX26wAEKJUKrvf3GCneI+3p9ekKBETmTZynor5ymQ0jtKflWqC0y+bt
   Mvyus1Er/EbffS0IjEH+8dsmtzJCwqxet2nfoEEUFAdzX9KrU28qxR8os
   aHux9p2LMrWoR6Y1uq2b3V5Co5ACHy692x2h5pYVbdfnVANPAP7kFeDWh
   TIEumyFucGOhX1WBQ6mMBlTpg0T3j5sAGhkGatUlYl/m7ACaToPWPA0vP
   w==;
X-CSE-ConnectionGUID: WGsQahWORHuF/4ZKXM7fzA==
X-CSE-MsgGUID: uPqr1n+gQpKqnMVy0feijw==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="100186557"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="100186557"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 16:41:52 -0700
X-CSE-ConnectionGUID: aGdb58JhR5Oy3Byt1s0ILQ==
X-CSE-MsgGUID: 3rkMDlQ3QJadIYr896tpsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="221106758"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 16 Mar 2026 16:41:51 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2HZE-000000004Jz-0jtp;
	Mon, 16 Mar 2026 23:41:48 +0000
Date: Tue, 17 Mar 2026 00:41:38 +0100
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [sashal:ai-review-prompts 12/13] htmldocs:
 Documentation/ai-review/index.rst: WARNING: document isn't included in any
 toctree [toc.not_included]
Message-ID: <202603170019.JEDjpKNw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git ai-review-prompts
head:   d184712fd9e150ba9bf9ab95428e342308ba9761
commit: d785f7ee9b77da96894a12e1096b1520f615575f [12/13] docs: add AI review prompt index
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260317/202603170019.JEDjpKNw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603170019.JEDjpKNw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:526: ./include/uapi/linux/landlock.h:45: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:526: ./include/uapi/linux/landlock.h:50: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:526: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:535: ./include/uapi/linux/landlock.h:166: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:535: ./include/uapi/linux/landlock.h:189: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/ai-review/index.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/skbuff:36: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
