Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FCBEEBB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Aug 2026 12:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786969901; cv=none; b=C6A/m1hwwkqiC7Z46zhq0cSSx1pJCeiyPezLrhwKsQdVqkBKrSM4xkCsrt+SQxjWq1+CAId2eaUitj84nuX20rfyhTyQt04khihi0gabdegb1jKvPFhtMOkk3rtuviHTotQSkfjNFIrQTLLJ28HN4kZgzLWp7vjAJ4zG6+Hwx8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786969901; c=relaxed/simple;
	bh=A0lKm7Nn+AGOFmE52/V1coJ994kFCS3OjOEtD9D8vz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SjfmpWXdSqkxDsfY/uBFIxP0oJ2OyHSMJqYfdhnJSTB9NM4faJU3B1EvBc9aesz6SEB6Fu2edBVP1Jnjt0rMEV7royC8Y7SvyliZ0zBDFl0S33JMwanK1C8vYGNP0mK/kocYS0DLA/5cJFyiXiXi6s5f+7mq2nDwocADJS8vIu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=Noa+A/b4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="Noa+A/b4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1786969565;
	bh=4HXI+/tOeTzBfLyjUJ60Z5GWX8vD9AQLufvskP68B9A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Noa+A/b4rTpNkvuKfwe8TXb/NA7HOarzPGrWYoU7Vqh3LiFYYWup5uO3HYAfToGse
	 j5YAvrGV49ZPz25wtLqhRHPksGRY1ZrSjhR7zC9+WWmbjkWkgoXXpOcuCdhXmNhKTc
	 VzsI3fW96H5qMNa4pzJobXgXupYvn1asZby3s87JO0IYNU1t0L6JLLbrq9E4Kz1Jno
	 nXlwS175CzIwVSM5ZzNHKm3ipQw8oBsRHJKL05dCqRn/RLfcbUaWzB2AeqOxOPpqS7
	 Y1aAVaoYHlzlSrEE0y4MWl3GoKiE+Fwsg7NOcDKda0K5MPZXpdJhZuWGaPELSiTyuT
	 tKYF83plAGhgQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4hNsWJ4cMwz4w1Z;
	Mon, 17 Aug 2026 22:26:04 +1000 (AEST)
Message-ID: <31c57a6a-c145-4d64-87bb-5ec1181c50ec@ellerman.id.au>
Date: Mon, 17 Aug 2026 22:26:04 +1000
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 13060/13846]
 arch/powerpc/boot/decompress.c:132:8: error: call to undeclared function
 '__decompress'; ISO C99 and later do not support implicit function
 declarations
To: Bjorn Helgaas <helgaas@kernel.org>, kernel test robot <lkp@intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Aksh Garg <a-garg7@ti.com>, oe-kbuild-all@lists.linux.dev,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
References: <20260811211543.GA697064@bhelgaas>
Content-Language: en-US
From: Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20260811211543.GA697064@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/8/26 7:15 am, Bjorn Helgaas wrote:
> [+to Madhavan, Michael; seems unlikely that 79752653c136 ("PCI:
> cadence: Fix host/endpoint dependencies for cadence-plat driver")
> would cause this]

Yeah I agree, it's an existing bug that this randconfig build has just tripped over.

cheers

>
> On Tue, Aug 11, 2026 at 07:40:11PM +0800, kernel test robot wrote:
>> Hi Aksh,
>>
>> First bad commit (maybe != root cause):
>>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   6b8c8af514d739d0335f5579b585e02babe8a727
>> commit: 79752653c136493ae8c3b4260f9f80de0b91d0bf [13060/13846] PCI: cadence: Fix host/endpoint dependencies for cadence-plat driver
>> config: powerpc-randconfig-r133-20260811 (https://download.01.org/0day-ci/archive/20260811/202608111848.Kv74vVhw-lkp@intel.com/config)
>> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
>> sparse: v0.6.5-rc1
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260811/202608111848.Kv74vVhw-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202608111848.Kv74vVhw-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>>> arch/powerpc/boot/decompress.c:132:8: error: call to undeclared function '__decompress'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>>       132 |         ret = __decompress(inbuf, input_size, NULL, flush, outbuf,
>>           |               ^
>>     1 error generated.
>>
>>
>> vim +/__decompress +132 arch/powerpc/boot/decompress.c
>>
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22   97
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22   98  /**
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22   99   * partial_decompress - decompresses part or all of a compressed buffer
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  100   * @inbuf:       input buffer
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  101   * @input_size:  length of the input buffer
>> 930a77c3ad79c3 Zhang Jianhua     2021-05-10  102   * @outbuf:      output buffer
>> 930a77c3ad79c3 Zhang Jianhua     2021-05-10  103   * @output_size: length of the output buffer
>> 6efc2f1a64ef62 Yang Li           2024-04-08  104   * @_skip:       number of output bytes to ignore
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  105   *
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  106   * This function takes compressed data from inbuf, decompresses and write it to
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  107   * outbuf. Once output_size bytes are written to the output buffer, or the
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  108   * stream is exhausted the function will return the number of bytes that were
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  109   * decompressed. Otherwise it will return whatever error code the decompressor
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  110   * reported (NB: This is specific to each decompressor type).
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  111   *
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  112   * The skip functionality is mainly there so the program and discover
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  113   * the size of the compressed image so that it can ask firmware (if present)
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  114   * for an appropriately sized buffer.
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  115   */
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  116  long partial_decompress(void *inbuf, unsigned long input_size,
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  117  	void *outbuf, unsigned long output_size, unsigned long _skip)
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  118  {
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  119  	int ret;
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  120
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  121  	/*
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  122  	 * The skipped bytes needs to be included in the size of data we want
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  123  	 * to decompress.
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  124  	 */
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  125  	output_size += _skip;
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  126
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  127  	decompressed_bytes = 0;
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  128  	output_buffer = outbuf;
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  129  	limit = output_size;
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  130  	skip = _skip;
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  131
>> 1b7898ee276b39 Oliver O'Halloran 2016-09-22 @132  	ret = __decompress(inbuf, input_size, NULL, flush, outbuf,
>>
>> :::::: The code at line 132 was first introduced by commit
>> :::::: 1b7898ee276b39e54d870dc4ef3374f663d0b426 powerpc/boot: Use the pre-boot decompression API
>>
>> :::::: TO: Oliver O'Halloran <oohall@gmail.com>
>> :::::: CC: Michael Ellerman <mpe@ellerman.id.au>
>>
>> --
>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-tests/wiki
