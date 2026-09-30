Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AB23D333C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 19:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790795689; cv=none; b=agNic0+c3ymHgW2GyerDtBL81xd1Fs4iHLvu7xRXVwKc4H7oIjU8YiN5zV34k26INKHj6HnGgyNbJbCTlasY7FZyqe1bPTDNmRYShwtWh03r1FqB+4Ah1GJPsEmd/N2hyZ/tKTRdiD6ZAu75Qievcbb/KVHx8fd5NkLQeCHwhAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790795689; c=relaxed/simple;
	bh=JsnFoBIpl+OUGgcVZ/EYX+Jy66LEu3tJaSH383ss+Yc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=DisxxPf6wCOs6Ac2+fQaGlZpsGiP1C8rTbVYf0M0Kncmh2aVN2s7LXohAm3OPooTnYE9RSgUCn1gA+mveRK+XuD0a54HD0nNeSOx8w1EIoS0yqrfUBEIRK578Ygw8p208tUIZJCqyFYinbvQY5xdArEuTDRLSZI9I5LA6gRYW98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=iGIUVcSD; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=w/KyJODS; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="iGIUVcSD";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="w/KyJODS"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790795679; bh=S5C0MrrT4Tjd9FUOXu1kKKB
	9Z4b4avhpPrWgGhV8TMY=; b=iGIUVcSDNBMypS9e0MDq6mhWeNGSU7DtJomhnL0YpY16gX0xOD
	j/Bokr4PORvz8cQyXMnRk0CgtzF+E54+JULslI/td6kmu7erbbfSAPTW3UhG7Z5xZPjpqTpoUvC
	QZyYNVq74122h2ee7ZE6xDqZEz/uslPT4vhBbo7agWq9FIVDEaZ5jxbXZvEvNCf+SUBodNKBCvn
	Brm2LPDymqpJRCyLCfJTcEXz3gjQxaeE1tIunSIQZQA04KFq2fw63TBlrDIs8LbHW+8Y+BP9vk6
	1/yObPkNHeRHTPfIbqr5O45dhAA3EmpwrosPjlRv7DDXDqmEYQ5YD4GJ0zFnADDOLQw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790795679; bh=S5C0MrrT4Tjd9FUOXu1kKKB
	9Z4b4avhpPrWgGhV8TMY=; b=w/KyJODSmmV0+RTSTXN+ggEUNkvBJHwPTM7lbLqYRGnum1ADNM
	rD3tkyT8UrEQtAzPonNF3H4jaUPiZ2XhCZCQ==;
Date: Wed, 30 Sep 2026 20:14:38 +0100
From: Bradley Morgan <brads@mainlining.org>
To: paulmck@kernel.org, "Paul E. McKenney" <paulmck@kernel.org>
CC: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5Bpaulmckrcu=3Adev=2E2026=2E09?=
 =?US-ASCII?Q?=2E18a_24/34=5D_ERROR=3A_modpost=3A?=
 =?US-ASCII?Q?_fs/btrfs/btrfs=2Eko=3A_symbol_?=
 =?US-ASCII?Q?=27cmpxchg=5Femu=5Fu8=27_undefined!?=
In-Reply-To: <4cecf5e2-3d35-45a9-8632-6d77ffc9b85f@paulmck-laptop>
References: <202610010054.roP05vYH-lkp@intel.com> <D067807D-352D-4B55-AEE6-B1334711EBD4@mainlining.org> <ce4ed8b6-cf07-44c4-b4e2-9cdb2b452772@paulmck-laptop> <F871853E-8AB8-4BDC-BAC8-10B56C4AE330@mainlining.org> <77b3d63b-4a41-4415-969d-a043ced63304@paulmck-laptop> <50436E31-D2B5-4DF7-B6D0-36E23CCC14C6@mainlining.org> <4cecf5e2-3d35-45a9-8632-6d77ffc9b85f@paulmck-laptop>
Message-ID: <21858FC2-A5C3-4DCD-B8CE-F3F2F41E7215@mainlining.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 30 September 2026 20:11:50 BST, "Paul E. McKenney" <paulmck@kernel.org>
wrote:
>On Wed, Sep 30, 2026 at 06:54:02PM +0100, Bradley Morgan wrote:
>> On 30 September 2026 18:51:53 BST, "Paul E. McKenney"
><paulmck@kernel.org>
>> wrote:
>> >On Wed, Sep 30, 2026 at 06:41:08PM +0100, Bradley Morgan wrote:
>> >> On 30 September 2026 18:39:55 BST, "Paul E. McKenney"
>> ><paulmck@kernel.org>
>> >> wrote:
>> >> >On Wed, Sep 30, 2026 at 06:07:46PM +0100, Bradley Morgan wrote:
>> >> >> On 30 September 2026 17:48:44 BST, kernel test robot
><lkp@intel.com>
>> >> >wrote:
>> >> >> >tree:   https://github.com/paulmckrcu/linux dev.2026.09.18a
>> >> >> >head:   90599c372e13369d11f6c1a01ff0094b16f72cf8
>> >> >> >commit: c98d10b438b5626edb3f4e06f4f62bcb6ed6fe90 [24/34] lib: Add
>> >> >two-byte cmpxchg emulation function
>> >> >> >config: xtensa-randconfig-1001-20260930
>> >>
>>
>>>(https://download.01.org/0day-ci/archive/20261001/202610010054.roP05vYH-lkp@intel.com/config)
>> >> >> >compiler: xtensa-linux-gcc (GCC) 8.5.0
>> >> >> >reproduce (this is a W=1 build):
>> >> >>
>> >>
>>
>>>>(https://download.01.org/0day-ci/archive/20261001/202610010054.roP05vYH-lkp@intel.com/reproduce)
>> >> >> >
>> >> >> >If you fix the issue in a separate patch/commit (i.e. not just a
>new
>> >> >> >version of
>> >> >> >the same patch/commit), kindly add following tags
>> >> >> >| Reported-by: kernel test robot <lkp@intel.com>
>> >> >> >| Closes:
>> >> >>
>> >>
>>
>>>>https://lore.kernel.org/oe-kbuild-all/202610010054.roP05vYH-lkp@intel.com/
>> >> >> >
>> >> >> >All errors (new ones prefixed by >>, old ones prefixed by <<):
>> >> >> >
>> >> >> >>> ERROR: modpost: fs/btrfs/btrfs.ko: symbol 'cmpxchg_emu_u8'
>> >> >undefined!
>> >> >> 
>> >> >> What?
>> >> >
>> >> >My bad, allegedly fixed:
>> >> >
>> >> >2395ec347553 ("lib: Add two-byte cmpxchg emulation function")
>> >> 
>> >> Have you merged 2395ec347553 ("lib: Add two-byte cmpxchg emulation
>> >> function") to your tree?
>> >
>> >Yes, it is on the current "dev" branch as of yesterday afternoon,
>> >Pacific Time.
>> 
>> Cheers, anything you want me to do today for it?
>
>And I just now refreshed it to add fixes for the bugs kernel test
>robot found.  Still the "dev" branch.
>
>846dac459e05 ("lib: Add two-byte cmpxchg emulation function")
>de32e93890c5 ("sh: Emulate two-byte cmpxchg")
>
>Please look at these and call out any needed changes, supplying fixup
>patches as needed.  (Or calling out changes to the commit logs.)  One
>question that I have is why the "(uintptr_t)" casts in cmpxchg_emu_u16()
>instead of casting using "(unsigned long)"?
>
>Then please send patches for the other architectures.
>
>Then the ARCH_NEED_CMPXCHG_1_EMU to ARCH_NEED_CMPXCHG_1_2_EMU name
>change (for the full set in one patch).  This must wait for all the
>per-architecture patches to be accepted.
>
>Then, if you wish, a patch changing the cmpxchg_emu_u8() function's
>"uintptr_t" to "unsigned long".
>
>Anything that I am missing?

Tags. You are missing all the tags.

David put tags. You were meant to add your tag.

>
>							Thanx, Paul

--- Thanks!
"I'm not a very positive person" - Linus torvalds
