Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A604367293
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 08:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786609225; cv=none; b=fxahjxCYCL1ulxEcw7FXn58ZsOb33Q/DpBFuuxnfe5Y1LrVHeqmyGv6+9N/eVMIsz9mQMsoe0zXMxbGVcIP3NE+A09vB+SMzDMF+J06WZ8QYHxDrZCVgChQsqFL1Do+w9pEN9c2DqBvmoNyp8Ar1a4jCPYU27AaU2RLJLaZ7JpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786609225; c=relaxed/simple;
	bh=MXFUdyK8IZdKYF2Es3JqXH7ozUP1YhgnRFPXrW6P3x4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GAfXIjdyei7AH1S3T50XjUxMxSa436oldObupxl+kbUful3zumGuNGi2TDJuzxUJxw3FpgPICwbxZj4r2j69riuDpyL53hCCjuSkqOHxqIMd/RdGNKOC199BL725Y0GrWYxpzZ4IYAX2Pm7IhYgd6aTjDm/tJvhvYJkyg/wkE6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sr0GrUAE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sr0GrUAE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 298EC1F000E9;
	Thu, 13 Aug 2026 08:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786609223;
	bh=BpLKv+HLKMXgHbkxllR3SmVTl3IvJW2Gw7BMJgcyPFA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Sr0GrUAEEZbftQUK6bqsx4JCEi6/OxZSbCKAnwmp0ulLlakrFBFF9Im+T1eSpbBPH
	 KOg5jRqMtEkPMKjV2W6LmMKa/OIEw/G58GQ+N5VxENQJWNF0uGv5DDlxYCf+sSekPo
	 Itn3mkvrqOB/lbkgkAZQmcgKHsTNHN+4IDXOxGey8aEUrSKjY7L+Bw+pniCufBLMsB
	 KJQhq2ZRrNbRrveVG+qe1L/fxu5n5vf77Lh1wvVRqfPpnioneAc6JjJbxVtLfNS5Zg
	 nPSG7/RN2K30ABo9Rkc5BXiKSshs/vfaSox3R6ObCZsXS/7fipmN4yi02xC8TY+0j0
	 V0DpwwZlSz/rg==
Message-ID: <450c036c-71fe-4192-a678-995389b845df@kernel.org>
Date: Thu, 13 Aug 2026 10:20:17 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [axboe:for-7.0/block 19/138] block/blk-crypto-fallback.c:154:17:
 sparse: sparse: cast from restricted blk_status_t
To: Christoph Hellwig <hch@lst.de>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
 Eric Biggers <ebiggers@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <202606012339.rZAl6Xq8-lkp@intel.com>
 <20260601152933.GA6444@lst.de>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260601152933.GA6444@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 01/06/2026 à 17:29, Christoph Hellwig a écrit :
> I think powerpc really need to pick the tricks from other architectures
> to make cmpxchg work on __bitwise fields.

Thanks,

Should be fixed by 
https://lore.kernel.org/all/289a7ffac9cb5b6d26a57fdc26605bf725285302.1786608980.git.chleroy@kernel.org/

Based on commit 212dd8477653 ("arm64: Silence sparse warnings caused by 
the type casting in (cmp)xchg")

Christophe

> 
> On Mon, Jun 01, 2026 at 11:26:16PM +0800, kernel test robot wrote:
>> tree:   https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Faxboe%2Flinux.git&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cb09ed76c517f4ac2a96a08debff29913%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639159245835365955%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=SCrQIL52YejLyMbT487%2Fu4y7bDdqD3W0NISJGASlqnI%3D&reserved=0 for-7.0/block
>> head:   72f4d6fca699a1e35b39c5e5dacac2926d254135
>> commit: b37fbce460ad60b0c4449c1c7566cf24f3016713 [19/138] blk-crypto: optimize bio splitting in blk_crypto_fallback_encrypt_bio
>> config: powerpc64-randconfig-r111-20260601 (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20260601%2F202606012339.rZAl6Xq8-lkp%40intel.com%2Fconfig&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cb09ed76c517f4ac2a96a08debff29913%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639159245835742509%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=mcTjhCA7fN2FQAsYEiRRY3xTOyBg%2BNJxAwMqeSERPG4%3D&reserved=0)
>> compiler: powerpc64-linux-gcc (GCC) 8.5.0
>> sparse: v0.6.5-rc1
>> reproduce (this is a W=1 build): (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20260601%2F202606012339.rZAl6Xq8-lkp%40intel.com%2Freproduce&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cb09ed76c517f4ac2a96a08debff29913%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639159245835767299%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3IobnZTPyXIEKog3PvyDf%2Bti4W%2F4jFM8O5QZG%2FVn%2Bkw%3D&reserved=0)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Foe-kbuild-all%2F202606012339.rZAl6Xq8-lkp%40intel.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cb09ed76c517f4ac2a96a08debff29913%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639159245835785008%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=dkHYbj0M7dRIfeyg8uLlJgQlMYbYi91eHIOx5FZOpJ0%3D&reserved=0
>>
>> sparse warnings: (new ones prefixed by >>)
>>>> block/blk-crypto-fallback.c:154:17: sparse: sparse: cast from restricted blk_status_t
>>>> block/blk-crypto-fallback.c:154:17: sparse: sparse: cast from restricted blk_status_t
>>     block/blk-crypto-fallback.c:154:17: sparse: sparse: cast to restricted blk_status_t
>>
>> vim +154 block/blk-crypto-fallback.c
>>
>>     143	
>>     144	static void blk_crypto_fallback_encrypt_endio(struct bio *enc_bio)
>>     145	{
>>     146		struct bio *src_bio = enc_bio->bi_private;
>>     147		int i;
>>     148	
>>     149		for (i = 0; i < enc_bio->bi_vcnt; i++)
>>     150			mempool_free(enc_bio->bi_io_vec[i].bv_page,
>>     151				     blk_crypto_bounce_page_pool);
>>     152	
>>     153		if (enc_bio->bi_status)
>>   > 154			cmpxchg(&src_bio->bi_status, 0, enc_bio->bi_status);
>>     155	
>>     156		bio_put(enc_bio);
>>     157		bio_endio(src_bio);
>>     158	}
>>     159	
>>
>> --
>> 0-DAY CI Kernel Test Service
>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fintel%2Flkp-tests%2Fwiki&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cb09ed76c517f4ac2a96a08debff29913%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639159245835802872%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=4Iyio2M%2Fz52Q9ilcjHSE%2Fmy98xR53NJQm%2FzwwXDH1qo%3D&reserved=0
> ---end quoted text---

