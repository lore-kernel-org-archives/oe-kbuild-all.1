Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBF3883B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 16:15:27 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37LCdM2u008101;
	Mon, 21 Aug 2023 10:51:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=v8xBfQxeoQPnjeB
	Dzth+3/Z0nKdnv94DtabVTPNaYV8=; b=qkq2yblBUVlbywAEdUSy2bKCxblQQKK
	xeGV2nBQH/0bQNwPrwsdO7nZjIVc0JTo9koi1aQl14P9srUaNnfGetPUfHNncAWw
	a2e3OZ+FFooHqW2wS4iiAIZ2j8YsfiztVNxOFdGAV92FfwT5IxV+ihmwxSR5UFoJ
	LW1lQoL49O0x9xouIbSjNpLcMw6z3fcW7X/naBDj142S6lZH0gOOEx7B6t7alnCO
	IHIbbGCLAPcyKKBaaHhPfT6dSH/k9iG1nxbZoAMwgiBMJLNVyElr9h1KbRqta81Q
	MJuHRGXUxVz0IiSj6efzr2xifEHF3T6B6YmMx0dlxiRgcdVAUOuJDDw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3sktt5rrdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Aug 2023 10:51:31 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 21 Aug
 2023 16:51:29 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Mon, 21 Aug 2023 16:51:29 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2ED6C3575;
	Mon, 21 Aug 2023 15:51:29 +0000 (UTC)
Date: Mon, 21 Aug 2023 15:51:29 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: kernel test robot <lkp@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>,
        Linux Memory Management List
	<linux-mm@kvack.org>,
        Lee Jones <lee@kernel.org>
Subject: Re: [linux-next:master 9894/11453] drivers/mfd/cs42l43.c:1138:12:
 warning: 'cs42l43_runtime_resume' defined but not used
Message-ID: <20230821155129.GD103419@ediswmail.ad.cirrus.com>
References: <202308212225.fGjY1rr6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202308212225.fGjY1rr6-lkp@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: GUwRwgVmIovh-d5UFMSLKbN_jkJSHfKt
X-Proofpoint-ORIG-GUID: GUwRwgVmIovh-d5UFMSLKbN_jkJSHfKt
X-Proofpoint-Spam-Reason: safe

On Mon, Aug 21, 2023 at 10:59:02PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   47d9bb711707d15b19fad18c8e2b4b027a264a3a
> commit: ace6d14481386ec6c1b63cc2b24c71433a583dc2 [9894/11453] mfd: cs42l43: Add support for cs42l43 core driver
> config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20230821/202308212225.fGjY1rr6-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230821/202308212225.fGjY1rr6-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308212225.fGjY1rr6-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/mfd/cs42l43.c:1138:12: warning: 'cs42l43_runtime_resume' defined but not used [-Wunused-function]
>     1138 | static int cs42l43_runtime_resume(struct device *dev)
>          |            ^~~~~~~~~~~~~~~~~~~~~~
> >> drivers/mfd/cs42l43.c:1124:12: warning: 'cs42l43_runtime_suspend' defined but not used [-Wunused-function]
>     1124 | static int cs42l43_runtime_suspend(struct device *dev)
>          |            ^~~~~~~~~~~~~~~~~~~~~~~
> >> drivers/mfd/cs42l43.c:1106:12: warning: 'cs42l43_resume' defined but not used [-Wunused-function]
>     1106 | static int cs42l43_resume(struct device *dev)
>          |            ^~~~~~~~~~~~~~
> >> drivers/mfd/cs42l43.c:1076:12: warning: 'cs42l43_suspend' defined but not used [-Wunused-function]
>     1076 | static int cs42l43_suspend(struct device *dev)
>          |            ^~~~~~~~~~~~~~~
> 

Will check this and get a fixup sent out tomorrow, my
understanding was that the __maybe_unused shouldn't have been
necessary with the new style pm macros but it seems I have got
something wrong on that front.

Thanks,
Charles
