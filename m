Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA64C8EB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 07:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767945243; cv=none; b=Z1gLoyflmbWj6M1FhE+hmENjN8QEaQMqmNRHRQp6IXbwm/iSO3OLi46xxlW7T/wQBMferxdFuTVQ+MQ1br6w8g5GCwbhlCvyA/ckE9qI2kRYMNRCoqVHZxyjjbCkoR50zMAcVEsCmUsWdDpX8pv6FVqJGlNA8zZlHKYudQ2X+nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767945243; c=relaxed/simple;
	bh=UBl6nO+UW7MIwwPjH/cY7CrgyYxzDug711QOeI3SpE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bFJu9er11+ShRkXmjv6GgxxMyzMBLhBbyM4J8qddbns6k2POftp/oETE70Z3FWs2IDcBHJrd3gnmf1bIZfiaM0SygdFS3A/O0ndiCzMA7MR7xuBpLAukq4x9L+iMOHu5Ad0Y+4paNXpLaNnZ4ZkF0syn3yxnlQ//v+sC7sUqvRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qV+WLt5v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qV+WLt5v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C44E4C4CEF1;
	Fri,  9 Jan 2026 07:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767945243;
	bh=UBl6nO+UW7MIwwPjH/cY7CrgyYxzDug711QOeI3SpE0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qV+WLt5vTta8lOYS3slaMGDcvSJAuU9EFijOeHSnbKgAOu2Vr3KrysvlL0bNEBuWZ
	 wMX5sWe6LAmfdMSygPCp+ed2FZWq/ogk369E4zTQ7ty2UupSpQZRvaZwPAa70+rQXh
	 X7VGghz3m04VqL78t5GNcLoGbjXviy3rw14IGE2eYEDOBcrXnQ3ilUND/XNm5IhW+W
	 vV+VjmqqvKDE6jEoK52jqhRwrrFZ4Dt91YgQC4J7gADJ+QfhBOOj3tmiwd39KRGYU2
	 eorjG22/B0zxox3exl+jeKdYORcOszDSOWuu2w50K0nKyiRd5bJSWw+HaBythm6zSU
	 sqzImG2uaTswQ==
Message-ID: <0fc9bf7e-291c-46f2-aafd-bd15835f41e2@kernel.org>
Date: Fri, 9 Jan 2026 08:53:57 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 3642/4725]
 arch/x86/kernel/cpu/aperfmperf.c:444 scale_freq_tick() warn: unsigned '*_d'
 is never less than zero.
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
References: <202601091047.oyAz4jQp-lkp@intel.com>
From: Vincent Mailhol <mailhol@kernel.org>
Content-Language: en-US
Autocrypt: addr=mailhol@kernel.org; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 JFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbEBrZXJuZWwub3JnPsKZBBMWCgBBFiEE7Y9wBXTm
 fyDldOjiq1/riG27mcIFAmdfB/kCGwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcC
 F4AACgkQq1/riG27mcKBHgEAygbvORJOfMHGlq5lQhZkDnaUXbpZhxirxkAHwTypHr4A/joI
 2wLjgTCm5I2Z3zB8hqJu+OeFPXZFWGTuk0e2wT4JzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrb
 YZzu0JG5w8gxE6EtQe6LmxKMqP6EyR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDl
 dOjiq1/riG27mcIFAmceMvMCGwwFCQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8V
 zsZwr/S44HCzcz5+jkxnVVQ5LZ4BANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <202601091047.oyAz4jQp-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi kernel test robot team,

Le 09/01/2026 à 03:45, kernel test robot a écrit :
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
> commit: 5ce3218d4f102aca5e90d3c831259b6e380f88b4 [3642/4725] overflow: Remove is_non_negative() and is_negative()
> config: x86_64-randconfig-161-20260108 (https://download.01.org/0day-ci/archive/20260109/202601091047.oyAz4jQp-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601091047.oyAz4jQp-lkp@intel.com/
> 
> smatch warnings:
> arch/x86/kernel/cpu/aperfmperf.c:444 scale_freq_tick() warn: unsigned '*_d' is never less than zero.
> arch/x86/kernel/cpu/aperfmperf.c:444 scale_freq_tick() warn: unsigned '_a' is never less than zero.


This warning has been silenced in smatch this week:

  https://github.com/error27/smatch/commit/a7b509b8171b4982b5a2a355f64d083dd76e03f9

Can you update the smatch tool in your CI? That will fix the issue.

Thank you,


Yours sincerely,
Vincent Mailhol

