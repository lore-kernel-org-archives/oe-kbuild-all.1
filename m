Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CEA1426B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Jul 2023 10:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690797994; x=1722333994;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=IaxYmHm4EZaKSgC5suwMmVZEvDpb9ol6gvHs5vhMcaM=;
  b=jkkdsJxWmYkwD1qmow4SCXrFnqQGGBHaQRLibq1M62UIfo/vkAyGup88
   LTom/FfWiGsqUDJUTDcmW54k/B3xvjPwdg5BhB7L0NbVqIFAAquF8DZHj
   u+EhR0HSxH5IwgI6tYnAAwA2B3eQopS6WNjnIOpepB4xvlZuwkBfLERwm
   WuaIXGPQZzep8jmQl13lAX7QD9bB+80o4L2iZTD6CypeOj4Z/jCUzzn9L
   Mv7xtMbBvtpmZW5PN64AkjBgSZJgiqL3ZIk0crqwbcykHMEgKoojaIXnE
   26IoPU6T7s9/opj89x9K4fM+Kv4E8CF2RTrg+T3l9o0NIqakJ7mSJ3Kuy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="435281148"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="435281148"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 03:06:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="793667637"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="793667637"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 31 Jul 2023 03:06:32 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQPnL-00053b-2j;
	Mon, 31 Jul 2023 10:06:31 +0000
Date: Mon, 31 Jul 2023 18:06:01 +0800
From: kernel test robot <lkp@intel.com>
To: Mingzheng Xing <xingmingzheng@iscas.ac.cn>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3] riscv: Handle zicsr/zifencei issue between gcc and
 binutils
Message-ID: <ZMeHiXvIBHAn3Ugo@c507f7d2ae6a>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230731095936.23397-1-xingmingzheng@iscas.ac.cn>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH v3] riscv: Handle zicsr/zifencei issue between gcc and binutils
Link: https://lore.kernel.org/stable/20230731095936.23397-1-xingmingzheng%40iscas.ac.cn

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



