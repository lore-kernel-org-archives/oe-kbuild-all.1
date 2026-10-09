Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D512F7F0F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Oct 2026 02:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791514552; cv=none; b=hkzEKNq7vs32suZxxWZFDEu7f47zW2uwt2rqLKGASkAg+6IrKcw8EVZjGmRbC2U++zKoJVekIBMuR0aYGAotGOM8tY2B4vQV/iWOnvZZx3zfAnI3r2B3U6W1Le6gs1kKdTbweHJOIN4RC7xAQkfbyTmb0c4hyUafGPDF2ZHT4rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791514552; c=relaxed/simple;
	bh=s/7cQJj6dkZmxCwXUVkGruBW6UVsJCpPoQ8BpXkWk4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KOXityRupoVlRKDpHU01OlUQwe1/5YKIyf9ajn4KeYgC6Cs5HpfGYNnmnnD2FM/8MKcrICP58pFr3aoT4HVSWzx8YM3euRcqQ19ue/3sEtJtT3oeommwg3DFINHVr91b+5JkyDBg4Cbhpk4E4omkr20xs40g/BhLars1DLynzYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VOQ1qhKU; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VOQ1qhKU"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso36691635ad.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 08 Oct 2026 19:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791514549; x=1792119349; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Ct3a3ES+gpFhXoGvhN0/KPCQwhxUgb4QuLzs3cj7zE=;
        b=VOQ1qhKUbhQgQ1Ad/nhYXPgureDAsnuqC102eRLhp3XzDTr7iPSeOnqfIdU1q0n+PA
         jQV3B73AIuE1tgVwDVAoq/9zNP8W02asZsmxyTl8cE1h8NdpAeX8AN+cRjG/I7m+X37W
         fklTXoi7PttmBb6W3JnG+f/UpF1cY5b0+7uGfLEOPz66yYK3wqciJ3xwrpNkEw4XVsrN
         LzD9Y3b0fQ+guaHbaKYIZifRPE0+Rk6N1KrORR8BM0MteG2yRQSAFcgpcYGL1N7+TyED
         PL3FJOLrazq2SZhPiUqFqsNxuYPOLCcsDSNIpve7t3j9Ki4tbpy5DqU2SAK0X3R4FrX6
         f1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791514549; x=1792119349;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Ct3a3ES+gpFhXoGvhN0/KPCQwhxUgb4QuLzs3cj7zE=;
        b=JLfYbfjba5IP8DavYaSYIxdxmYbdJQ6mSBp3S8opcjqRrsVlIw5xABYEwAqo4gmDek
         ARpTcBT6H7/gkIvi/3uiH2sG3bqtiCkG7NNRgDPAhg5FKGoC4GCqVh7EJFi2TzbzEcgm
         5EvV4VpISBGQJ4ltRHCX+6xNSYHz6eh6y4qZG6XUiD5xxjdVose0O6QN7qpRYjkS1hvB
         KuIrvwOf3Sk2W8Qi0qA1w/unBfQUn9qb3nGThZ8FZcnGZWs4f3JJUM1HmWPjJ1ogbIf7
         jgZ4Irk8CTqL+K3PTGH03VrDvnY3UgPBsKuGMxoSTQb2eedWfSLHHosjjSYm1asoTaBQ
         wayw==
X-Gm-Message-State: AFq9FYLuR4InECQkGAGqOrHDV6q3QCQSjxjD87XigI4q9hY2vpiOvGE6
	uJG1BfIVGEOGU2eZmDeGd4zmmC2FZ+SnM6A03/z+qIswOIZ9oO5IuIZG
X-Gm-Gg: AYBFou0t6gOl/G8jDmLnpqcRl6F9ms69t4Q4owp1RCmIkH+Vgl5NqoTeb1aWhlTH9kX
	HTP6zHL/LgJn2ACf2ci8w457ANWv2N5/wHwzZR14GUQEo8+mMmGO0qyROLyTu7rLM8LSDc8CrEy
	TIktz1m2FHb2fQcG4zsFBJtwWws3Zx0mIoeN9/VihAOqGR/whlX5fdi4rQx/y7AC9xhky+zMnLL
	GwjP1Ai2Z2nPnTBy3Nj32xPwkRp33gX3MUdEcj/LiZWr9KZmZ9A5O11SDtAmx6RS3P8MzWcrzcC
	fIYskRGHmyHAVSnYpDS+pSTSg8PSrB/06gKSeGkaWnfpmt4uX2zRP0fjhBkKzh0QQrnl36Mjtph
	G1Ex5kDWqn/MWJSGeF4XZLOzU4oVdmN78wgx2Eso8bQTcjQKdJP8gUBM1aQlmx/ltPQOirGQUmr
	3GZ96mxSiwA1/vZP29knKlA6Qd4b0H2G8DA8Pui1BTUeqqEknHyMOrlywuzxky1Jkl3yaa0SHnd
	JS4re8RSpRyPUQzRY2P
X-Received: by 2002:a17:903:41c1:b0:2e8:2f95:7658 with SMTP id d9443c01a7336-2e8427f0416mr5152055ad.7.1791514549085;
        Thu, 08 Oct 2026 19:55:49 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b1987sm2341315ad.38.2026.10.08.19.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 19:55:48 -0700 (PDT)
Message-ID: <5bac3071-5823-4714-8c39-662b91c927a3@gmail.com>
Date: Fri, 9 Oct 2026 10:55:18 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [tytso-ext4:dev 21/41] fs/ext4/inode.c:4002:24: sparse: sparse:
 symbol 'ext4_iomap_buffered_read_ops' was not declared. Should it be static?
To: kernel test robot <lkp@intel.com>, Theodore Ts'o <tytso@mit.edu>,
 Zhang Yi <yi.zhang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-ext4@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Ojaswin Mujoo <ojaswin@linux.ibm.com>
References: <202610082225.lcsAyIiF-lkp@intel.com>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <202610082225.lcsAyIiF-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/2026 4:18 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
> head:   35aefefd7aba0801bab635b11943f932626be3b2
> commit: e933fd1b6cd5322563d5caf283dabd9cd09bcef8 [21/41] ext4: implement buffered read path using iomap
> config: arm-randconfig-r2308-20261008 (https://download.01.org/0day-ci/archive/20261008/202610082225.lcsAyIiF-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610082225.lcsAyIiF-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610082225.lcsAyIiF-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>>> fs/ext4/inode.c:4002:24: sparse: sparse: symbol 'ext4_iomap_buffered_read_ops' was not declared. Should it be static?
> 
> vim +/ext4_iomap_buffered_read_ops +4002 fs/ext4/inode.c
> 
>    3998	
>    3999	static DEFINE_IOMAP_ITER_NEXT(ext4_iomap_buffered_read_next,
>    4000				      ext4_iomap_buffered_read_begin);
>    4001	
>> 4002	const struct iomap_ops ext4_iomap_buffered_read_ops = {
>    4003		.iomap_next = ext4_iomap_buffered_read_next,
>    4004	};
>    4005	
> 

Thanks for the report. ext4_iomap_buffered_read_ops should indeed be
marked static, and I've already fixed this in my local v7[1]. v7 also
includes fixes for some corner case issues reported by Sashiko on v6 as
well as some small optimizations, and I expect to send it out today or
tomorrow once testing is done.

Hi Ted, would it be okay to replace the current version with my v7 on
ext4 dev branch after I send it out?

[1] https://github.com/zhangyi089/linux/commits/ext4_buffered_iomap_v7/

Thanks,
Yi.

> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

