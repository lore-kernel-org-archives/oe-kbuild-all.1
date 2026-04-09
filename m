Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD953DEFFE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Apr 2026 15:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775748441; cv=none; b=KnpDtFC8yxouBPI61oKulH2WWFGTYqetllO3HQFjt1EgJTmNX6DiQDURd5x8QOcHgYtjkNb7u/P/JMy65NTloOFT6mj/daQAiS7hO8vCkM9NYRZ3DtMMLC4oeMKhvh+BoEnj6vm+IvtQ8V6Cyb2JOaB9DAT+J8UzX/GboxwxxTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775748441; c=relaxed/simple;
	bh=S3pSBDCTX4rUUODT2cBO3fCW2o7gMdbPErCM2aNpb+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qmw8ixwlCj/6xmoe27r+SQkDUOH2w0jXrqE3KU457ABu8qPqhSEGH5VJTFL9J/BJhfdnCNK2CGTDM3Gj0phWrp8FdwG+VCVKDkYsXZi8PNrzrlAJviClwoQq2jSul1HsM8djOdyNtW7Nq6pymlL4uAfBXq65VxRzsTyzyhqU/u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=WMoHHTja; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="WMoHHTja"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=FcMq4cxdyosUjkZJ3qNxqjcKqAI4FRnSrONbzZqUFCk=; b=WMoHHTjaCATKMbkDIkVi6pJM3c
	oCmDapi2NaKpKNqMdlbZ61aBPR80BoK7ztGkz6Om3EIFktq29qUW/qwxBExkusyEXmd+SytbFIH5t
	YjgNgtu3O48lq4rY86PCLrE5ATf52uim6MQ7hZwPat0iPlQvqhnF7drzfZ1ZYvgMG63YnKA6xrsnn
	cP2i4OkI1L91hKjMMJUFXSzV/uuLa4j0KEuzocN/ZrGfx19SE3xnwZJ8PeE7r/vD5oBk12QBI30Hw
	9TdAdBrgsWQWgaqF4THuF15JQLD4bDoq/JDgc2qC7giaiUTuuAy4ZBHEF4VOO/2g+sms1369ZBwVJ
	xnU2j2AA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wArHn-009IId-1c;
	Thu, 09 Apr 2026 15:27:16 +0000
Date: Thu, 9 Apr 2026 08:27:11 -0700
From: Breno Leitao <leitao@debian.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Tejun Heo <tj@kernel.org>
Subject: Re: [tj-wq:for-7.1 14/18] kernel/workqueue.c:8289:34: warning: array
 subscript 1 is above array bounds of 'int[1]'
Message-ID: <adfFCF_JsqNhh5nB@gmail.com>
References: <202604022343.GQtkF2vO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202604022343.GQtkF2vO-lkp@intel.com>
X-Debian-User: leitao

On Fri, Apr 03, 2026 at 04:42:14PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-7.1
> head:   41e3ccca00b374b7f39cf68e818b59a921cd7069
> commit: 5920d046f7ae3bf9cf51b9d915c1fff13d299d84 [14/18] workqueue: add WQ_AFFN_CACHE_SHARD affinity scope
> config: nios2-randconfig-001-20260402 (https://download.01.org/0day-ci/archive/20260402/202604022343.GQtkF2vO-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604022343.GQtkF2vO-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604022343.GQtkF2vO-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    kernel/workqueue.c: In function 'workqueue_init_topology':
> >> kernel/workqueue.c:8289:34: warning: array subscript 1 is above array bounds of 'int[1]' [-Warray-bounds]
>        cpu_shard_id[c] = cpu_shard_id[cpumask_first(sibling_cpus)];
>                          ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I can finally reproduce it. This is related to nios2 having NR_CPU=1.

	In function ‘llc_populate_cpu_shard_id’,
	inlined from ‘precompute_cache_shard_ids’ at /home/leit/Devel/linux-next/kernel/workqueue.c:8321:3,
	inlined from ‘workqueue_init_topology’ at /home/leit/Devel/linux-next/kernel/workqueue.c:8354:2:
	/home/leit/Devel/linux-next/kernel/workqueue.c:8289:55: warning: array subscript 1 is above array bounds of ‘int[1]’ [-Warray-bounds]
	8289 |                         cpu_shard_id[c] = cpu_shard_id[cpumask_first(sibling_cpus)];
	|                                           ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	/home/leit/Devel/linux-next/kernel/workqueue.c: In function ‘workqueue_init_topology’:
	/home/leit/Devel/linux-next/kernel/workqueue.c:8171:12: note: while referencing ‘cpu_shard_id’
	8171 | static int cpu_shard_id[NR_CPUS] __initdata;
	|            ^~~~~~~~~~~~
	make[1]: Leaving directory '/tmp/wq-nios2'


Working on a fix,

Thanks for the report, dear robot :-)
--breno
