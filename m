Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E3E134DD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 18:09:28 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id E4887320099B;
	Thu,  7 Sep 2023 14:09:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 07 Sep 2023 14:09:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	joshtriplett.org; h=cc:cc:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1694110167; x=1694196567; bh=LBA6H6bkKgfZDVO638EkCYdaffYLDMTRGDB
	F3VMYrGc=; b=PA8kQw7Y28LJX4WtI0BJEs+NzwJUCPqpDG9op7/FxHCif4ZOZ4+
	SxYGWkSVvAL5dPE99dlNBnimCq1LnXxPgf4FwBp4xHrM1F7yFD9IN+J683Xnentm
	4q1BSMyZ4/4x10/KnFj1YaYIuvoa1odPdC5hRLO1qcIv9yTc/2AcZB5rrIBIvm/E
	otgFGi5MYlTaHiJrXILY6FMSd0wcvHewfftAT1HDH2FjWTu4pZj55EAG+XbyZYOU
	3bumxffEDvQ43zqS/AdzODIsLLWudQAq45HsjQUqKl9Eg1SBWj0HCkV+B9RnqsT+
	zyVjRfvbZVmIxUTJSiz27m/l1eXeHt/EZOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1694110167; x=1694196567; bh=LBA6H6bkKgfZD
	VO638EkCYdaffYLDMTRGDBF3VMYrGc=; b=ZFMXw7D3iTNh37nnJAAo0fXPGcxOH
	0w/UC1x35zGBzTpWPFP1pYKz0nBZxyEN9EKJ/UveEtASBGVprUxCyIahHGwN0cho
	nCXFQFR3LbQcx6nuY5bvuXaXAnQIeOwvb3slEb7eMfx617CEz9WJU1JxxQ+12ZiE
	2rolc3UoDj3NkDCY+cOz/keLUsOO2aHCFNhfqldiEmf4nBJ+bM/oWX5EAEJO9dI2
	7DhRajYQtF2Y0fl2jbVpCrglg3Ro8yoUMyp49cPGJudyWJj/OYGvY6wN8VKhHCqe
	p3JGUH9pJHIsQTuf7H6NYIsqroyOxPtQQQQXZY+kIgeBApxosty5gWe+w==
X-ME-Sender: <xms:1hH6ZHSUGUx3GB40M6BeoDXA4ydhGEbxG3TzGYqutMnBWHpcWivCRQ>
    <xme:1hH6ZIyJKh2Rh_Y0avuEmZkYw5eoM_jC1yIFPu2qlnlXfD-DaqBZLJyZJL0U5AQQI
    9XeJTDSYwL8krd-teU>
X-ME-Received: <xmr:1hH6ZM2wIM8wwD2XS4AFQQgczU6vyVSdVAM1p8MNSV0IsL7aqjNaUBvTbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudehhedguddvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeflohhs
    hhcuvfhrihhplhgvthhtuceojhhoshhhsehjohhshhhtrhhiphhlvghtthdrohhrgheqne
    cuggftrfgrthhtvghrnhepgeejudeutdelfeeugfdvgefhheeuhfetffeftedvffegkeet
    hefhhedtvddtgeeinecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjohhshhesjhhoshhhthhr
    ihhplhgvthhtrdhorhhg
X-ME-Proxy: <xmx:1xH6ZHDhopeyWD9B1ltBV7i_nwNjMJh5FsuKm5GIX7YHvtmkUq879g>
    <xmx:1xH6ZAhhaBbXY8lTEYLXi6QSHfL3ckEpM_gFXQJ8OdYPZ7ZDeboabQ>
    <xmx:1xH6ZLoc5TXf6YNRtqclHQXSChfwsk6MaWavp-HITifdoddTFMSxeA>
    <xmx:1xH6ZMaqivasVUsGZpQIvXLfIcF5iQgKFlBc68IxKkvWVRnBwLU1FA>
Feedback-ID: i83e94755:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Sep 2023 14:09:26 -0400 (EDT)
Date: Thu, 7 Sep 2023 11:09:25 -0700
From: Josh Triplett <josh@joshtriplett.org>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [lkp] [+168 bytes kernel size regression] [i386-tinyconfig]
 [051cfd2102] waitfd: new syscall implementing waitpid() over fds
Message-ID: <ZPoR1QPkyYXv6ASb@localhost>
References: <20230906152316.tXAcC%lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230906152316.tXAcC%lkp@intel.com>

Hi Nick,

On Wed, Sep 06, 2023 at 11:23:16PM +0800, kernel test robot wrote:
> FYI, we noticed a +168 bytes kernel size regression due to commit:
> 
> commit: 051cfd2102807119e31bdd4947d18388b3df5fd3 (waitfd: new syscall implementing waitpid() over fds)
> https://github.com/oracle/dtrace-linux-kernel v2/6.5

Could you please add a Kconfig option for the new system call, similar
to those for other new system calls?

Thank you.
