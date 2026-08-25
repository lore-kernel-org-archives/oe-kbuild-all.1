Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A873AD528
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Aug 2026 18:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787682507; cv=none; b=EibQ9l2/MHj83q435ZPt6PZaXncNsMfJu26WpkwPQSMnZ7Y+pSKhl0Yaxj92bLZQLLYaFZ7VqR6tqK8lr4qN3wIpGljcNJKnS2Z48JRvvVBDu1AQTRi17TNpTQD9r5Inp7z1UqYg0DtV22ryDy5J/dDZ0gyPkZI1kAYeSQD6Z+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787682507; c=relaxed/simple;
	bh=obvywmpVt5UOP1Ua27dLs17SyXI7iJ2ohG8xUYlaF0I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=g3UPO2v/61dt3DaOhhIGdSlvsyn70q9nCu6iHXkkEGmqF+OCTeWTByJme2iazGaescdwV+ZBe5jE9cjmcpsFj6Hj2zMYh1nElCAgUTRoAiLRGWuL91hpl41cylDXOYfRkF9WlKEq+qDpLATCBWbiYCh1MwVu/vyNeNMQWMkAafc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MO0O9kFa; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MO0O9kFa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787682506; x=1819218506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=obvywmpVt5UOP1Ua27dLs17SyXI7iJ2ohG8xUYlaF0I=;
  b=MO0O9kFaN5qBytWgTls9EdIhmcUuujKyQ/Is5D6HN5TAcRd90xFOi9sY
   Ni+V1FJg+88KykJNOPdqxlQ+EkvP5VYhKrj4BOw0kTgw3rmdkuVpc0MfM
   AY0qLGZ40akXHU8hMpUsOecewrIQCV6a7+HM+ClEQvoNf4fBrDjWLDBqc
   j5TE/TsLw8FLFex0mY+y6KrEY3gZHrIS/q91722qnEY5U6fW+hCz/5Ese
   dxkEQrz5OJrJl0lclDkqIqPr/lBHdfetgClyQXCLh2hD1mTc/8l+MOvqg
   YnvUhUrL7Z7BO/KqZu+OBm8s0Y8dQKQW1oKI/aJQfUSEaQ3wgqimWljJH
   Q==;
X-CSE-ConnectionGUID: duxkDLDNSiS4bELvKUfkRQ==
X-CSE-MsgGUID: w4JEdA+pTm+fp3J/g96JFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="98833552"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="98833552"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 11:28:25 -0700
X-CSE-ConnectionGUID: 56f0lnFjRXOiAgXO8WbbRQ==
X-CSE-MsgGUID: A61ziOw7S/qzH+/vZfiPtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="292207905"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Aug 2026 11:28:23 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyvsj-000000006Ex-1Yer;
	Tue, 25 Aug 2026 18:28:21 +0000
Date: Wed, 26 Aug 2026 02:27:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:scratchpad-v10 11/14]
 drivers/gpu/drm/drm_gpuvm.c:1075:1: sparse: sparse: symbol 'ops_ENABLE_KEY'
 was not declared. Should it be static?
Message-ID: <202608260253.IQ02eJZT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git scratchpad-v10
head:   45e5e0071e4ad7afee159e8cbe6cbe50c8db61d0
commit: 692bad3253e1b14cbdb50c946158ff4708f6b7f1 [11/14] drm/gpuvm: Route gpuva_op allocations to scratchpad
config: i386-randconfig-061-20260825 (https://download.01.org/0day-ci/archive/20260826/202608260253.IQ02eJZT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260826/202608260253.IQ02eJZT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608260253.IQ02eJZT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_gpuvm.c:1075:1: sparse: sparse: symbol 'ops_ENABLE_KEY' was not declared. Should it be static?

vim +/ops_ENABLE_KEY +1075 drivers/gpu/drm/drm_gpuvm.c

  1074	
> 1075	DEFINE_SCRATCHPAD_PARAM(ops,
  1076				"Toggle DRM GPUVM operations scratchpad allocator");
  1077	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
