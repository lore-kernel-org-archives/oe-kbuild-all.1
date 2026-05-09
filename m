Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A8D800
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 May 2026 12:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778329529; cv=none; b=V3+uwBWAINHDOYKRzw+vvt5KVvSBA55ZgljGqV/yOAECbrTOWhmKtlY/ONm9ltdvwOFc39R/azpHF0Asszx8M6cZbDI0hpauWFpjoS8hnly3zm2Nhv3UlGgRGO1GhE9Elt/QElOLAmc6NbrVPoJVB3s+NcZMgpSy35kYQT+1CR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778329529; c=relaxed/simple;
	bh=NYgFYiIJ6+qZuZpggDCWyTr4RuJYVHvO/3pJ6JbKmxw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YYw8NxD5sgh6GUWseQqmtz8BAWqeFSOAKhiaYAXw/rQVoOAZo07UG+e6Uq+rGSDQtrcbb8VVJpUJ0X91UsEtfimxkKZ0RJglvW9JqK0tmB2qJJ1fOaG7+nZr70kLk6zg0WQIKFwWrZ3LDhfsB5lDMiDvjXxMYMryvgI3MkxjpQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SjnHZc+r; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SjnHZc+r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778329527; x=1809865527;
  h=date:from:to:cc:subject:message-id;
  bh=NYgFYiIJ6+qZuZpggDCWyTr4RuJYVHvO/3pJ6JbKmxw=;
  b=SjnHZc+r4vVVTQG4JZtIuJR1J6cL/TrMr9LJF1Hon+U5dlL/PdGRFl2s
   tEttosbsoB3wi35eFhnHtuzrAuwqjvVjDKZ8NKHeeWoe1auLTbtNxsiNh
   DqFDM83oxFsl9GRvK0Z+RxjJirOFYPXD6ipUq9C4C6O2uk2ENOh88C+fI
   LRY6W0ReqX8J7Kt6vxNBPWm3KU9C/H/pRUkvbBDd97hZWYmCLHOyCxoO/
   FSrdeBG53fNH0yXClZdOZUjsdrRCdCihNR4HvqVn33dMHxsEvbmzlkywh
   mUVnmphoLwLZV/vLE3nrPnLD6Q6lain6+XvjLaaBkZDn9/xTTvvFWK+6/
   w==;
X-CSE-ConnectionGUID: 8KI2qjgOShegsExVqvKRQA==
X-CSE-MsgGUID: 3ZqKbfy6SXChElkb8DWhdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="96713028"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="96713028"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 05:25:27 -0700
X-CSE-ConnectionGUID: Q5zBXa3sQbCkwAbYjnr5yA==
X-CSE-MsgGUID: 8Zi/jmvGRCibj4RmQjh8cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="260739032"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 09 May 2026 05:25:25 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLgkF-000000007Rf-3yoK;
	Sat, 09 May 2026 12:25:23 +0000
Date: Sat, 09 May 2026 14:25:14 +0200
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 38/178] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202605091436.pGvWFSr8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   4b1d0b029fb1b7f93e72be2d9553a358b8054d7c
commit: 3d5dce3b744d97ece8a7dffcae8ee883efd99a65 [38/178] drm: apple: DCP AFK/EPIC support
reproduce: (https://download.01.org/0day-ci/archive/20260509/202605091436.pGvWFSr8-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#599: FILE: drivers/gpu/drm/apple/afk.c:554:
+	 * which will contain the real data.
+	*/

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
