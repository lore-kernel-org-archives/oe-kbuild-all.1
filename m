Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795183914;
	b=p097MXomxdOcYTrCwiLxFbhXP/Pw7QO17AfFGYD4cw+HyMWWET5nUR0lXZqVcfKvOreo
	 M5WLVA1EPB16sdqm9JmDViXvnrJxg7hxCYMqoIVovmpxGbiRLjynHVI61eWwJorSc3cTP
	 2Ukn8n2MYncw93o9s20YqVyglcN76+IVxfNfT4Ppc6AdoHPgYEpYHEyw30yokcy7rJcSL
	 CIjJWCT0zXEUnirQlyolQ1DKkooMfXlEkAI7evrDtO0nQks37NdHxPW2xgSIOiQpzoZ3o
	 Ss+/u9GhqeG80oqdeRbQrMdqP2NUlrY4qkaGHGLNQf5FkpXzXFn9OwkUOkZ9eYnZ4wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795183914;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ZBbQk8a0qwJyyZzfihqfu03RiUW3k2mqmdUEdutUeqw=;
	b=sqMlTlnO/JDqzV7x4sPc2UgTPEYh5Vg0i7Tdk80EUyhL+ehJBsjK00+xucHlzvXJormz
	 +aA3FpMt7HTBWQ/77Xw6zBo+OAp3MisiHqwfmydAn6juR8VZvEWxD+6NG2s2T2AlBJNkH
	 uipYtv/YIXPqHDVM3IUrcSLivFdloDCYPdAY/sGvxOcsrImxMaEQ60BGSAXHj8dUvE1Hs
	 uFWYPz7pCijW1NN0bpPgWuMeB0pBXLXrWtwLPswf/f9GuLdNoyM9TfC4kWtzwBfrbbYmk
	 ZWFX5gqo9XOfvjfxZvS1/YlTcumG+gkFPdhfbd2yzFK3Kj411vFdy5VaNL+AB7zSG8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MMcFzJ4W;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721BB606A320
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Nov 2026 14:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 721BB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MMcFzJ4W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795183914; x=1826719914;
  h=date:from:to:cc:subject:message-id;
  bh=bRvUuOS7j5OnBBaieSIPhpq5hPnDlMAe6ljdLP+7ljQ=;
  b=MMcFzJ4W8a5QHUYxLbQypGgnoE9yQ8YB0aqYDARd4VhD/QKspIpi3G2C
   vfSoElN7/+RKILHrQgM2UOUD0WtDZDP3tt/+olCsZ1uUBTnwmHZD+Z06Q
   JCC9fnw829NOkGCc8H77woWoWR0VylYcxHFL6BOgnBohd5hfh10jVc/6M
   3RyHh/vvEP2Gb1c3jdOq78oakIaT5LVP1frNdK1gHYL8ct20Rn65u7Zrl
   omExEnpHFvMnfdOCv2PH6KoHntQLGKW3ndxd7j9oXXBLVNR6PkBJTUryQ
   2eyW6SeGtu6SYqb3yw++dmylKIuAWRUbwZMDTLC3+uKcP70p3Y5jNSXU8
   A==;
X-CSE-ConnectionGUID: +wABImIkSwO7U+4QJUnjKQ==
X-CSE-MsgGUID: zJMfs9foRCiOZyzyyWBQ/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3907726"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3907726"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 06:11:53 -0800
X-CSE-ConnectionGUID: zucUFMm5TmqX0Lt/j6/7ug==
X-CSE-MsgGUID: Dg5Ec0gARlKJKyTZMs/vEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10924131"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 20 Nov 2026 06:11:52 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUPLB-0000000042n-2fo6;
	Fri, 20 Nov 2026 14:11:49 +0000
Date: Fri, 20 Nov 2026 15:11:45 +0100
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:dhchap-keyring.v4 3/9] Warning:
 drivers/nvme/common/auth.c:154 function parameter 'keyring' not described in
 'nvme_auth_extract_key'
Message-ID: <20261120151054.H1TXEVuN-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git dhchap-keyring.v4
head:   1b78746d90bfa570d96e88475983421f24c38b0d
commit: a4ba99532949b46aa13cd6d71ccf791cbd692390 [3/9] nvme-auth: switch to use 'struct key'
config: microblaze-randconfig-2200-20261120 (https://download.01.org/0day-ci/archive/20261120/20261120151054.H1TXEVuN-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/20261120151054.H1TXEVuN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261120151054.H1TXEVuN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/nvme/common/auth.c:154 function parameter 'keyring' not described in 'nvme_auth_extract_key'
>> Warning: drivers/nvme/common/auth.c:154 function parameter 'keyring' not described in 'nvme_auth_extract_key'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
