Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317F44D5A0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Apr 2024 18:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711995614; cv=none; b=D/FifLE28xnct8P/1riKl5AAAcg5cFE79+rrO/8gbnE97AFD+ikGk9nriQyvJFme2dDDfNjDtXKP3ArgeYCMty03W9ckIFPGYEQ1XwNg7CtDbZAfs96B+f3ytJb2PFtssVg7UDdLNyu/h470MaIAfmBhjFkokXkHO/Y5Sg6KBfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711995614; c=relaxed/simple;
	bh=+Vigd7B02s/zxF9i4BjlHFfftd7c0toRxUcDXJy6sl8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=nFVzuJZEbvLuHuurJ07SJ1DVZ+pYjQzV2y8SSa1XA0nm+nAMd0y0zmZvkq/RTQnH+yJr/sXSQsIrFfPFZWJOsG/cndeVVywTWwDjyzojDMuBrM3jfIHm/18nJyOj86F7/RzSijmIGlENQ5zrr9bgRbBJj2Trv4hcosPhPxSq4pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=BLHm6wCW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BLHm6wCW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 862CDC433F1;
	Mon,  1 Apr 2024 18:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1711995613;
	bh=+Vigd7B02s/zxF9i4BjlHFfftd7c0toRxUcDXJy6sl8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BLHm6wCWEgMkkUkXEazyTT6r24+376jCtCKvdnoj5KL02yGcIDCVfXd3my4NC7ihE
	 yq2SC357dm89YScijBGEBgzAopib4I2Dguha/Xmes9dhXiXm8CerWQnbxM12zkAHgx
	 rancl49qn6+XjHgfVhl7Ri+vbo2fHeookpW5+mvE=
Date: Mon, 1 Apr 2024 11:20:12 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: "Ho-Ren (Jack) Chuang" <horenchuang@bytedance.com>,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, "Huang, Ying" <ying.huang@intel.com>
Subject: Re: [akpm-mm:mm-unstable 262/270] vmscan.c:(.text+0x2c90): multiple
 definition of `mt_find_alloc_memory_type';
 kernel/sched/fair.o:fair.c:(.text+0x1db4): first defined here
Message-Id: <20240401112012.58634114b0e76e062fad7bc0@linux-foundation.org>
In-Reply-To: <202403311952.oxw8fSed-lkp@intel.com>
References: <202403311952.oxw8fSed-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

OK, thanks.  I'll drop

	Patch series "Improved Memory Tier Creation for CPUless NUMA Nodes", v9.

and shall await a v10.
 
