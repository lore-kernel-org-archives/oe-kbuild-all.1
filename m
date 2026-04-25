Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D821096F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Apr 2026 01:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777080492; cv=none; b=npcSJxgst/B30pK7pK6svX+p+jh8y9ZS5jSpggE+m9xvV0zEckzvHJh4xQj6fnoh1rPb0AU8TiFWLh8aGygYrkiTonAVOGQuu4y8hIuuR3SyLJywazFrbl+khaL/QFsAXOsiXlKxIFYeRfzsCZV9wI5fQjrQw6DsK3CEjtkPGso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777080492; c=relaxed/simple;
	bh=AJ4OzuNeLHA5VcZOpebYutwWtYxpGJ/H3z8+mgYpvMU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Tuc9nyYMbByFxP5iTWVMPzAkWgomtlqe5eDofyCAYVsVhTBFmv7LOkvhR32c7BeyhhfiJtk03nC+W2B2acYuFa3dIbXaGUDxeLR6cs4NV5t7O06/lvBnt+PNEi3mxeHm/KnzTtk/IrsXpEPL0N1DLY/K5koiJOCing0ycDKJM8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DWTE9NDi; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DWTE9NDi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777080490; x=1808616490;
  h=date:from:to:cc:subject:message-id;
  bh=AJ4OzuNeLHA5VcZOpebYutwWtYxpGJ/H3z8+mgYpvMU=;
  b=DWTE9NDil8CW+Z+BI33q5Dx+sf1JHY4xzFk1Xf2aDgfx/l+y6MrZPHbt
   TVt+zYa9gWoMAtc8lEPvFnl44gnhhKu5a20BYdsSbcX86gZdTh+oB8Vla
   9k1xM0mIUTSqgFulTpmbaZdayDqLBZdY0SAw8ZkmbGeXEEIV4j+7p24EZ
   M0KU+hcnSLf56Qoi99RH3A5PO3Tjo79tyZvqHFc+T/MghBKoco9gOiG13
   4NODN28owCbZ19QD/y4fZhevmfsP1YmAARD3Zn0daiQh9td99uNREeADk
   x1eE89seTbYCMPZMBrG5ShGwvC2mq9vcGRZnfrFN/WKBhEY8GqJV7OcML
   A==;
X-CSE-ConnectionGUID: s2CEfG2aSGu1z+wpJSv7kA==
X-CSE-MsgGUID: rMBU3v1HTE+K+NEq/n6u5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="100717658"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; 
   d="scan'208";a="100717658"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 18:28:09 -0700
X-CSE-ConnectionGUID: AGwP8lhjTXqTS9J+25aAPw==
X-CSE-MsgGUID: cpXo/i7/QZGRYZPFVOn7bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; 
   d="scan'208";a="238168537"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 24 Apr 2026 18:28:08 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGRoT-000000003Kv-3SOL;
	Sat, 25 Apr 2026 01:28:05 +0000
Date: Sat, 25 Apr 2026 03:27:07 +0200
From: kernel test robot <lkp@intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/ABI/testing/configfs-vkms:156:
 WARNING: Inline emphasis start-string without end-string. [docutils]
Message-ID: <202604250335.R5IBnKsN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Louis-Chauvet/drm-drm_mode_config-Add-helper-to-get-plane-type-name/20260424-152519
head:   177e00894c9e43673e9a7be1793cc3eadad851be
commit: f42d76109a7f0b9d570292ca3771bc42a4224351 drm/vkms: Introduce configfs for plane format
date:   18 hours ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260425/202604250335.R5IBnKsN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604250335.R5IBnKsN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/devicetree/dt-object-internal.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,^Documentation/scheduler/sched-pelt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,(Documentation/translations/[
   Using alabaster theme
>> Documentation/ABI/testing/configfs-vkms:156: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/core-api/kref:328: ./include/linux/kref.h:72: WARNING: Invalid C declaration: Expected end of definition. [error at 96]
   int kref_put_mutex (struct kref *kref, void (*release)(struct kref *kref), struct mutex *mutex) __cond_acquires(true# mutex)
   ------------------------------------------------------------------------------------------------^
   Documentation/core-api/kref:328: ./include/linux/kref.h:94: WARNING: Invalid C declaration: Expected end of definition. [error at 92]
   int kref_put_lock (struct kref *kref, void (*release)(struct kref *kref), spinlock_t *lock) __cond_acquires(true# lock)


vim +156 Documentation/ABI/testing/configfs-vkms

 > 156	What:		/sys/kernel/config/vkms/<device>/planes/<plane>/supported_formats
   157	Date:		Nov 2025
   158	Contact:	dri-devel@lists.freedesktop.org
   159	Description:
   160		List of supported formats for this plane. To add a new
   161		item, write its fourcc code prefixed with '+'. To remove,
   162		use '-' prefix. Use '+*' to add all formats, '-*' to
   163		remove all.
   164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
