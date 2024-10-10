Received: from smtp-fw-33001.amazon.com (smtp-fw-33001.amazon.com [207.171.190.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A90B1991DF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Oct 2024 16:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.171.190.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728579562; cv=none; b=kw0seFi97A/r1dGuKisYQTogdHGU0Ou36r9nl8FRDlhNn5GTvoam7fAk1rmeKDuv7iNDjs99PKPmp5LAhrBflK7k38oMMUsDxkLOt74V4WIrQ5Ux3PblVp8McSmiyljC80eY8bANbwb3BUSws8tEtBKg2lUdaAWGAPkLZImvO9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728579562; c=relaxed/simple;
	bh=aSbDvPl0l2gT3KQe2UB+0QUGeA3D+BQJqJp52TfWCm0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KJgGxfnr6QdMg1NvjUs3AlJ1XtoZ69Y/dSz/JtyM5SAPXyhkj6V33P7+QZXP1tis8mMH/OmTNOcyjd1QeIuoH+LGYY3SB8M8ACz30H4XPTZxK89g3WWSz6H2LjWvHZlpXtisryapHMCaXAIQj6vxGKEg6Xzptt5+TLyPuTIxu1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=Fgg8Pyr6; arc=none smtp.client-ip=207.171.190.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="Fgg8Pyr6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1728579561; x=1760115561;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rsuAyPMPCOm6K3l1MvAmQSN/OPgcd5XlIXD8d4k9F10=;
  b=Fgg8Pyr6TzJq3Kxhw64zqArO/v4Ehssj10SMsRSPx+Np+WwmRQ47kRm5
   KO4gxZRxxDDRR0E+kGHqrsrDqbw5YfXiQd+xUVcWNIsnm/9orTYv5OrTL
   lEfiVAbMH2bfIuF1OXnmSXm1FQ/Ljboj/pzC5wAbCdD0pxvndIlZTiCdR
   I=;
X-IronPort-AV: E=Sophos;i="6.11,193,1725321600"; 
   d="scan'208";a="375077505"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-33001.sea14.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 16:59:14 +0000
Received: from EX19MTAUWB001.ant.amazon.com [10.0.7.35:42675]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.49.108:2525] with esmtp (Farcaster)
 id ab486c42-568b-4626-97eb-4031e32e9a58; Thu, 10 Oct 2024 16:59:14 +0000 (UTC)
X-Farcaster-Flow-ID: ab486c42-568b-4626-97eb-4031e32e9a58
Received: from EX19D004ANA001.ant.amazon.com (10.37.240.138) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Thu, 10 Oct 2024 16:59:11 +0000
Received: from 6c7e67c6786f.amazon.com (10.88.181.15) by
 EX19D004ANA001.ant.amazon.com (10.37.240.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Thu, 10 Oct 2024 16:59:09 +0000
From: Kuniyuki Iwashima <kuniyu@amazon.com>
To: <lkp@intel.com>
CC: <edumazet@google.com>, <kuniyu@amazon.com>, <linux-mm@kvack.org>,
	<oe-kbuild-all@lists.linux.dev>, <pabeni@redhat.com>
Subject: Re: [linux-next:master 2784/3639] WARNING: modpost: vmlinux: section mismatch in reference: rtnl_net_debug_exit+0x20 (section: .exit.text) -> rtnl_net_debug_net_ops (section: .init.data)
Date: Thu, 10 Oct 2024 09:59:06 -0700
Message-ID: <20241010165906.65898-1-kuniyu@amazon.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <202410101854.i0vQCaDz-lkp@intel.com>
References: <202410101854.i0vQCaDz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D044UWB002.ant.amazon.com (10.13.139.188) To
 EX19D004ANA001.ant.amazon.com (10.37.240.138)

From: kernel test robot <lkp@intel.com>
Date: Thu, 10 Oct 2024 18:08:07 +0800
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   0cca97bf23640ff68a6e8a74e9b6659fdc27f48c
> commit: 03fa534856593bb4edf4935451fa55863e34a108 [2784/3639] rtnetlink: Add ASSERT_RTNL_NET() placeholder for netdev notifier.
> config: parisc-randconfig-r064-20241010 (https://download.01.org/0day-ci/archive/20241010/202410101854.i0vQCaDz-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410101854.i0vQCaDz-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410101854.i0vQCaDz-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> WARNING: modpost: vmlinux: section mismatch in reference: rtnl_net_debug_exit+0x20 (section: .exit.text) -> rtnl_net_debug_net_ops (section: .init.data)
> WARNING: modpost: vmlinux: section mismatch in reference: rtnl_net_debug_exit+0x24 (section: .exit.text) -> rtnl_net_debug_net_ops (section: .init.data)

Will fix it soon.

Thanks!

> 
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for GET_FREE_REGION
>    Depends on [n]: SPARSEMEM [=n]
>    Selected by [y]:
>    - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
