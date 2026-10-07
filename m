Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CD02CCB5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 18:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791398955; cv=none; b=o1CJCZl7Zr2SCSE0RCkVFXpFKrVZHPs0+DazPdGMRsvXknb0zXwoxa+fcbf8Fu59bw83meJkj/hKj/0e76sJ3g1W2wg7Phy7OHGVmKHJBmQJ6HNv/v6ag7Cki1A1ialZbh6LjUEmApfLVeE6PyBfz0cw0uTXn46/QtzKciHMzNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791398955; c=relaxed/simple;
	bh=LQYOg5rZcP/o/9drwvuzE/9Dw7y3fyBFrjidEB4aydA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jXGM8KerWHbvzJo9DHlK+pnExgivMNcJdFnl6Si6cIn4edtNtQMDNVVhfonsdeyeUH7fSzcY1ylLMkD8V++hJl+JqcH58tuf2EpGlrrOvN7j9Uuv8vTtObmMt56wPnKXhdtcn6+IWlDSl14+YnzwQCUXmpGFeiCP9/i7n5oCB30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iytv6S1R; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iytv6S1R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791398954; x=1822934954;
  h=date:from:to:cc:subject:message-id;
  bh=LQYOg5rZcP/o/9drwvuzE/9Dw7y3fyBFrjidEB4aydA=;
  b=Iytv6S1ReHG0vqfXZF9G61d36GQ9wIhKgK3WHI9q3R+HwSM1W7zd5Z/8
   7TfoImFfJn80gT7MTj8fGCUsj2GlR4z5CpXmTm7HykZoVkpcn8b7BMdk1
   kX8i/BgGgGPU6NgIai8khy78t9HHlfKB/WnSSuWyI2dEoqC0loQp/N6IU
   LFfV+zzwV5yNPlBbiVBYYlQKVgVzXM3G/oTZBLnXYyglVn6M5Pte5/+dJ
   8mg+WqZX5OEyFx1MgdAFAZQ9jnRYdjZVRLIMK67DyS0r3Eo9gMvU0bsco
   FiQ06h7WtNy6hEj2SH/Z+fli2Hcyn6hShT1+W488RuZjg286sFkdr7xht
   w==;
X-CSE-ConnectionGUID: GWH8ucpxSr69X5FWyUzf5g==
X-CSE-MsgGUID: lJ7Sef40RyKquNdVwhBNsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="72691"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="72691"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 11:49:13 -0700
X-CSE-ConnectionGUID: ciKc2fOAQKuiW3Uy+Xpekw==
X-CSE-MsgGUID: zitVru/eTl2e3W3uVj4a7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="306982725"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Oct 2026 11:49:12 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEWhR-000000003Qm-2ZLh;
	Wed, 07 Oct 2026 18:49:09 +0000
Date: Thu, 08 Oct 2026 02:48:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 2/45] .clangd: warning: ignored by one of
 the .gitignore files
Message-ID: <202610080246.ApL54D0q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   576b8c5d619ed8abcc9bd2106e527d2c3aba9b2d
commit: c9f64b30c5fadbe741e136d0b203c711250454a1 [2/45] clangd
config: i386-alldefconfig (https://download.01.org/0day-ci/archive/20261008/202610080246.ApL54D0q-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610080246.ApL54D0q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610080246.ApL54D0q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .clangd: warning: ignored by one of the .gitignore files
   Documentation/.renames.txt: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
