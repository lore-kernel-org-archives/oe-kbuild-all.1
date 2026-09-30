Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7505351123D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 17:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790790872; cv=none; b=oh2sdWvFoz055NK9y5DcxwBB77bha6imr6FT+95GM24XzX+tJpfvaPoK6fw+IKpYbNwKYUqALnV6GBE8Im71BOFflJpVdBSNY6tWnAodah5bibDnrVBvp+FjsPty1tC/wxUO61IWLJ8qszdnDn+DiugbcjF/CvDXsh8bWjHjW08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790790872; c=relaxed/simple;
	bh=SG5ColaaFzKE24kl6TM7bwL4Jn/ayKcKSElsRXJrND4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=VYv5l3FTJhRmD5x+kFEmJzsB+aFzjeaJZJ9A9OdaIFnUR+ExhhLjnDEK2ZNLc+383Lej7l0eUDt2XBi/7GdLozE1pSuYJCZtmUSnVHa/aT9DfjpBEUj1HKRIDOQLtcwuOe81Nba4qGrd5Z9PNtBplIlHmrLphwY9h1UpUgm4RjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=IlyD79+1; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=NB2xVjxe; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="IlyD79+1";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="NB2xVjxe"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790790843; bh=6Uq4gBwEv8AyH5q3RExvHLk
	bbZqWVfTGoUvZlRp8y4A=; b=IlyD79+1/TEpg+FlfjtRvGncRXT2B0vDwtuWp2VCFG9EpXTVCr
	PNLLb7o93lPizUWyJTtmF6eP6ommT3kUOGcF803witQaMlZP98e3peM7Ecm86mnObXyovCOh6Ty
	ozSjNPCghXBzUXimjQGzmM2J0w+VkxsQp1ZizMoxj0CXOsqtOd3AnMGBPNHfmozUjajCqCY1Ukw
	hOdXXvQ5R+ZlVveVO/adCrDC1rAMg4GyJHEZCUApcIq8V/OjCoieX2zQrXm1x/wEkZhk6INiBpF
	quR+sTx1/47AN2UXgwXohuxDWFFnBuHzv62MJpc1L5ccuw6lgJqe6XJVAkC9Bof7+BQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790790843; bh=6Uq4gBwEv8AyH5q3RExvHLk
	bbZqWVfTGoUvZlRp8y4A=; b=NB2xVjxebYOgEizD6EVw47h506WtA05o7mGgf38Z1rpcwlFDiv
	Vv3DFunl2kHxE6LG4rlIgmbXpKnm1NDQhlBA==;
Date: Wed, 30 Sep 2026 18:54:02 +0100
From: Bradley Morgan <brads@mainlining.org>
To: paulmck@kernel.org, "Paul E. McKenney" <paulmck@kernel.org>
CC: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5Bpaulmckrcu=3Adev=2E2026=2E09?=
 =?US-ASCII?Q?=2E18a_24/34=5D_ERROR=3A_modpost=3A?=
 =?US-ASCII?Q?_fs/btrfs/btrfs=2Eko=3A_symbol_?=
 =?US-ASCII?Q?=27cmpxchg=5Femu=5Fu8=27_undefined!?=
In-Reply-To: <77b3d63b-4a41-4415-969d-a043ced63304@paulmck-laptop>
References: <202610010054.roP05vYH-lkp@intel.com> <D067807D-352D-4B55-AEE6-B1334711EBD4@mainlining.org> <ce4ed8b6-cf07-44c4-b4e2-9cdb2b452772@paulmck-laptop> <F871853E-8AB8-4BDC-BAC8-10B56C4AE330@mainlining.org> <77b3d63b-4a41-4415-969d-a043ced63304@paulmck-laptop>
Message-ID: <50436E31-D2B5-4DF7-B6D0-36E23CCC14C6@mainlining.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 30 September 2026 18:51:53 BST, "Paul E. McKenney" <paulmck@kernel.org>
wrote:
>On Wed, Sep 30, 2026 at 06:41:08PM +0100, Bradley Morgan wrote:
>> On 30 September 2026 18:39:55 BST, "Paul E. McKenney"
><paulmck@kernel.org>
>> wrote:
>> >On Wed, Sep 30, 2026 at 06:07:46PM +0100, Bradley Morgan wrote:
>> >> On 30 September 2026 17:48:44 BST, kernel test robot <lkp@intel.com>
>> >wrote:
>> >> >tree:   https://github.com/paulmckrcu/linux dev.2026.09.18a
>> >> >head:   90599c372e13369d11f6c1a01ff0094b16f72cf8
>> >> >commit: c98d10b438b5626edb3f4e06f4f62bcb6ed6fe90 [24/34] lib: Add
>> >two-byte cmpxchg emulation function
>> >> >config: xtensa-randconfig-1001-20260930
>>
>>(https://download.01.org/0day-ci/archive/20261001/202610010054.roP05vYH-lkp@intel.com/config)
>> >> >compiler: xtensa-linux-gcc (GCC) 8.5.0
>> >> >reproduce (this is a W=1 build):
>> >>
>>
>>>(https://download.01.org/0day-ci/archive/20261001/202610010054.roP05vYH-lkp@intel.com/reproduce)
>> >> >
>> >> >If you fix the issue in a separate patch/commit (i.e. not just a new
>> >> >version of
>> >> >the same patch/commit), kindly add following tags
>> >> >| Reported-by: kernel test robot <lkp@intel.com>
>> >> >| Closes:
>> >>
>>
>>>https://lore.kernel.org/oe-kbuild-all/202610010054.roP05vYH-lkp@intel.com/
>> >> >
>> >> >All errors (new ones prefixed by >>, old ones prefixed by <<):
>> >> >
>> >> >>> ERROR: modpost: fs/btrfs/btrfs.ko: symbol 'cmpxchg_emu_u8'
>> >undefined!
>> >> 
>> >> What?
>> >
>> >My bad, allegedly fixed:
>> >
>> >2395ec347553 ("lib: Add two-byte cmpxchg emulation function")
>> 
>> Have you merged 2395ec347553 ("lib: Add two-byte cmpxchg emulation
>> function") to your tree?
>
>Yes, it is on the current "dev" branch as of yesterday afternoon,
>Pacific Time.

Cheers, anything you want me to do today for it?

>
>							Thanx, Paul
>
>> --- Thanks!
>> "I'm not a very positive person" - Linus torvalds

--- Thanks!
"I'm not a very positive person" - Linus torvalds
