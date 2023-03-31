Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1E3256F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Mar 2023 12:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680264817; x=1711800817;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=1HSYvc/2MSoXPTF8gyGbdgCwK9wLMPPADEFHj/kFmGo=;
  b=RGvHkSCMCYjke4QazKtvidNGv4oJAJwXkOUVAfS8ggVs1sN8gZDuLDYO
   cJOOtskO7UsERZCiR4paM/7C2GxloUpjpbnaK6/O8WVoUn62pB664tedq
   t5SfSuDmnhOeD/Ekrbk/NAL+b99JbkiFVWu0UJLBO6QUrtr2/rz9BHGZV
   N2M49V2eL6etFJYivH2oCmOs8szPbBStmV+E9OPwke2vtws332LqxaIPo
   D0k1y3TtF87IcpV2uZx/yg2I0MdO3UMUy5aFHRmgw2ciwNqn4T6SEPC40
   usZ1o1+fYgtGjsUo5T8AAAIbPP63FK3drXKZuZYG6vxcu63uzSO7HduE8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="404155074"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="404155074"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 05:13:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="685112575"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="685112575"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 31 Mar 2023 05:13:36 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piDdP-000LlC-1P;
	Fri, 31 Mar 2023 12:13:35 +0000
Date: Fri, 31 Mar 2023 20:12:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/2] wifi: rtw88: usb: fix priority queue to endpoint
 mapping
Message-ID: <ZCbOQTYSR2KZegdt@ec83ac1404bb>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331121054.112758-2-s.hauer@pengutronix.de>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH 1/2] wifi: rtw88: usb: fix priority queue to endpoint mapping
Link: https://lore.kernel.org/stable/20230331121054.112758-2-s.hauer%40pengutronix.de

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



