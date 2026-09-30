Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5A253ECF3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 17:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790790081; cv=none; b=fJsuKWGItwFFEf/XzCc7n3nkBSnU2AEgHyYXAmzNK+9m4dbX6hwWz4wGi8ly2LXT6KuwAGnrXB4ILV5gltC3FZNu640CWICx/+ajjVmMOlDX9C7cwFMEpiAmVphARhzGOmR9oEydxkP9Rb187ozrHSsciPj+ju/vuK081CHz0j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790790081; c=relaxed/simple;
	bh=rb6F2PcWp8N9WChzkA39I0tGbzGeOyNuvnsF6CR3x3E=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Xey5ns4MLKIeZ56YH5iJRRku8HOwF546zfsVJSX347rbmeWYXlmTBLo5/daPm6bH19Mb3qrl0ps9ouuqvJpAKG8kcMlfA/et6p216j8J8ENbOT3BJetD2kIDAJxiAXezqu4JbREVqfcXi1xHRQ//FHjDnpo2cMVX5Z51p8umqEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ApY6Fvt+; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=sJ3LPMzf; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ApY6Fvt+";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="sJ3LPMzf"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790790069; bh=2DKboaN4SqesTuUYSYov/H7
	pbz2gXWaBCL81qQiAchE=; b=ApY6Fvt+CkhxCteQP9gZCoH1aTV9SE/US5Bck6D+b/W+EzzRxI
	G085ziusilEEl98JTzGnVdt7Lb9dc3bHysaelJZb2ixnT+vO+2H/9npIOkDWXwCGO1SQx2GCzCM
	0NIxsPzrB8UvOklQbiRQ5NbXQ3hNmbpSkCbx+9JYRg/p8W2o49Zt0SqfS6fguwDaLgnUdCFTPiF
	cqc0GooFvMGF0WkUFvBg0+c3jA+vCPD929Kx9urIqAMoxT+qM1KY7WeJYJnXl7rDQ7aLNL5UqP8
	yVu0XHM4PBG+w65+vIT9gQUJy/kFS6SM0XKNE2yPjukrX6q6Ds8BKOY1Bd5sJd/5FXQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790790069; bh=2DKboaN4SqesTuUYSYov/H7
	pbz2gXWaBCL81qQiAchE=; b=sJ3LPMzf6ZAgRPX6x3ZENmORwcuqhfhK7gOd/LoJxzZUEnrjaJ
	l0jHwOyTfGSHQEv17XQdauCe+0+8SN6klnDQ==;
Date: Wed, 30 Sep 2026 18:41:08 +0100
From: Bradley Morgan <brads@mainlining.org>
To: paulmck@kernel.org, "Paul E. McKenney" <paulmck@kernel.org>
CC: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5Bpaulmckrcu=3Adev=2E2026=2E09?=
 =?US-ASCII?Q?=2E18a_24/34=5D_ERROR=3A_modpost=3A?=
 =?US-ASCII?Q?_fs/btrfs/btrfs=2Eko=3A_symbol_?=
 =?US-ASCII?Q?=27cmpxchg=5Femu=5Fu8=27_undefined!?=
In-Reply-To: <ce4ed8b6-cf07-44c4-b4e2-9cdb2b452772@paulmck-laptop>
References: <202610010054.roP05vYH-lkp@intel.com> <D067807D-352D-4B55-AEE6-B1334711EBD4@mainlining.org> <ce4ed8b6-cf07-44c4-b4e2-9cdb2b452772@paulmck-laptop>
Message-ID: <F871853E-8AB8-4BDC-BAC8-10B56C4AE330@mainlining.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 30 September 2026 18:39:55 BST, "Paul E. McKenney" <paulmck@kernel.org>
wrote:
>On Wed, Sep 30, 2026 at 06:07:46PM +0100, Bradley Morgan wrote:
>> On 30 September 2026 17:48:44 BST, kernel test robot <lkp@intel.com>
>wrote:
>> >tree:   https://github.com/paulmckrcu/linux dev.2026.09.18a
>> >head:   90599c372e13369d11f6c1a01ff0094b16f72cf8
>> >commit: c98d10b438b5626edb3f4e06f4f62bcb6ed6fe90 [24/34] lib: Add
>two-byte cmpxchg emulation function
>> >config: xtensa-randconfig-1001-20260930
>(https://download.01.org/0day-ci/archive/20261001/202610010054.roP05vYH-lkp@intel.com/config)
>> >compiler: xtensa-linux-gcc (GCC) 8.5.0
>> >reproduce (this is a W=1 build):
>>
>>(https://download.01.org/0day-ci/archive/20261001/202610010054.roP05vYH-lkp@intel.com/reproduce)
>> >
>> >If you fix the issue in a separate patch/commit (i.e. not just a new
>> >version of
>> >the same patch/commit), kindly add following tags
>> >| Reported-by: kernel test robot <lkp@intel.com>
>> >| Closes:
>>
>>https://lore.kernel.org/oe-kbuild-all/202610010054.roP05vYH-lkp@intel.com/
>> >
>> >All errors (new ones prefixed by >>, old ones prefixed by <<):
>> >
>> >>> ERROR: modpost: fs/btrfs/btrfs.ko: symbol 'cmpxchg_emu_u8'
>undefined!
>> 
>> What?
>
>My bad, allegedly fixed:
>
>2395ec347553 ("lib: Add two-byte cmpxchg emulation function")


Have you merged 2395ec347553 ("lib: Add two-byte cmpxchg emulation
function") to your tree?
>
>							Thanx, Paul

--- Thanks!
"I'm not a very positive person" - Linus torvalds
