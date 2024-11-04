Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C76B1ADFF5
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 09:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730711362; cv=none; b=Cwxz8dxfgBVNbb99+WBy+9JPQY8B1pt35b7bO+ZnkijAN3lmXsofPJ+B+6cWbx0eac0q4YZyiY6mEblEArqEPxuSOWbSDKW/yMcoqTAHeQam6AUHq4NIfqcpo9OtpxEj2fi1N6WnKdsx0KKDBQMpKBcy2hBl5ArBJFSETM+NmCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730711362; c=relaxed/simple;
	bh=ifqPukSiWEbvQx2BNyq44t24PrtspIIZb3U4Z0syxko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a51gJXDTIhJJ2ubcC7yfCsGB2HeV+CMmouF34A8jWbG7vk8B9MjoSM3Zku3ER2IF3+EBLqDYEfxNhbq4+SkaNszqGtmiTuO3j8yP730cYz4k52TLOQJEr3j8QCSofJ8o375ocJ9H9eX/1s1/moC94KW6ivHlKx5Cz+vwWnNq5x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Up3kIHGU; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Up3kIHGU"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5ceca0ec4e7so1910390a12.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 04 Nov 2024 01:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730711359; x=1731316159; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=055q6HVRLMtsIiCxhqKFgJlzoVTgwNt+2YbIpiGOuNo=;
        b=Up3kIHGUTzG9xPdZy0IfNituFl3XA/Fofqy/JHeyEJzkGBrei2GdCRyVnxwQFPrnIF
         DM0LAPKKHMCafSEu+3KQ9ZZH+EiDcw+gU09p5FNA8LjeJCnTsNwhfjwL3vlf5PdMPxgS
         amRR8EXssxdmh69u9+lfmfAeZ4waIeMV89xsR7JfZrt8nMDjWaFVxIJUbzmkTEpQSVJO
         Bl9NKZcWFcmM/WGPy/Vhtq6DOeG3guAzZcB5dxMR4AF0lPT137+5nIAGviw78X5CNclp
         HGryHhuRhJ5QR/yXeTYWJK//F/RVt7hyJpjtFCZJXa9ggT4QUnTJDbFaT81IIO4W7CeX
         0C4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730711359; x=1731316159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=055q6HVRLMtsIiCxhqKFgJlzoVTgwNt+2YbIpiGOuNo=;
        b=IrvUwekEKoPclmoLyjgL1nNXKZ6QiezG8CdWlBgdlyLfEOpgo5iFHWKaCjGLdzmkQt
         3beGicYYF/QF6hKsHCTX81DaM2gBhADwpl9/Hf89QMiKHsl9vKfJg05vSatyOVtpRNXr
         m8WdUVCi2I07TocvpijC/FzTQxxe5ppTgvcIlWpaHHxaeIFYsrZWBlTrKPbgI5OwRAW+
         2k+YU/zGjHyyuiKpvb6ki91CrB3N0pj/ccjQ3AFEk9ht0iDrLAqPA58bxnKU8x08SHFl
         BNCH48tJO7vWmp9z8sGUu35LiiZP5yAdFZLHSk17Pkh98OHD3nLR1TLTdLfxIGRQF85z
         Y2Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVWZyz5jHr3lDwK48U7qz2HCJiuNHPXG87EHDLXLN/DaC+PcldKEXMlUOukJgOHi89N+UFsgLHhOVADwpbG@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5/7B+42MCzd4CncxkuJky6CMy6nivNnVebZ1ffqVxkrQ0Jsil
	89iiEtotDY17kBCCchx9V+j7tDYQXyBhXQ1KWytppHGsnSIi7KUc6dnFeED/w5bi5xMLj4vzeq8
	VLlXXeHZhfFdOpgo6KSlNNpbTW8s8UbcIBTXRBw==
X-Google-Smtp-Source: AGHT+IG7T23Pew0G4bjyo8FIV5YjqVKWXQFF//1S8lbRwvUhNbZuSM2H8qF/oqLViu8AJNrr6QEfuupKRznSgIqZeV4=
X-Received: by 2002:a05:6402:51ca:b0:5ce:d397:9f5 with SMTP id
 4fb4d7f45d1cf-5ced3970cbemr2889559a12.24.1730711358703; Mon, 04 Nov 2024
 01:09:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241103145153.105097-14-alexghiti@rivosinc.com> <202411041609.gxjI2dsw-lkp@intel.com>
In-Reply-To: <202411041609.gxjI2dsw-lkp@intel.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 4 Nov 2024 10:09:07 +0100
Message-ID: <CAHVXubj8EXCXNPuJ+hqrHwyujjz3GDcqqMjQ4ZFC5VbmZurV3w@mail.gmail.com>
Subject: Re: [PATCH v6 13/13] riscv: Add qspinlock support
To: kernel test robot <lkp@intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, 
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 10:05=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Alexandre,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on arnd-asm-generic/master]
> [also build test WARNING on robh/for-next tip/locking/core linus/master v=
6.12-rc6]
> [cannot apply to next-20241101]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/ri=
scv-Move-cpufeature-h-macros-into-their-own-header/20241103-230614
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.=
git master
> patch link:    https://lore.kernel.org/r/20241103145153.105097-14-alexghi=
ti%40rivosinc.com
> patch subject: [PATCH v6 13/13] riscv: Add qspinlock support
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51=
eccf88f5321e7c60591c5546b254b6afab99)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202411041609.gxjI2dsw-lkp=
@intel.com/
>
> includecheck warnings: (new ones prefixed by >>)
> >> arch/riscv/include/asm/spinlock.h: asm/ticket_spinlock.h is included m=
ore than once.
> >> arch/riscv/include/asm/spinlock.h: asm/qspinlock.h is included more th=
an once.

Yes but that's in a #ifdef/#elif#else clause so nothing to do here!

>
> vim +10 arch/riscv/include/asm/spinlock.h
>
>      8
>      9  #define __no_arch_spinlock_redefine
>   > 10  #include <asm/ticket_spinlock.h>
>     11  #include <asm/qspinlock.h>
>     12  #include <asm/jump_label.h>
>     13
>     14  /*
>     15   * TODO: Use an alternative instead of a static key when we are a=
ble to parse
>     16   * the extensions string earlier in the boot process.
>     17   */
>     18  DECLARE_STATIC_KEY_TRUE(qspinlock_key);
>     19
>     20  #define SPINLOCK_BASE_DECLARE(op, type, type_lock)               =
       \
>     21  static __always_inline type arch_spin_##op(type_lock lock)       =
       \
>     22  {                                                                =
       \
>     23          if (static_branch_unlikely(&qspinlock_key))              =
       \
>     24                  return queued_spin_##op(lock);                   =
       \
>     25          return ticket_spin_##op(lock);                           =
       \
>     26  }
>     27
>     28  SPINLOCK_BASE_DECLARE(lock, void, arch_spinlock_t *)
>     29  SPINLOCK_BASE_DECLARE(unlock, void, arch_spinlock_t *)
>     30  SPINLOCK_BASE_DECLARE(is_locked, int, arch_spinlock_t *)
>     31  SPINLOCK_BASE_DECLARE(is_contended, int, arch_spinlock_t *)
>     32  SPINLOCK_BASE_DECLARE(trylock, bool, arch_spinlock_t *)
>     33  SPINLOCK_BASE_DECLARE(value_unlocked, int, arch_spinlock_t)
>     34
>     35  #elif defined(CONFIG_RISCV_QUEUED_SPINLOCKS)
>     36
>     37  #include <asm/qspinlock.h>
>     38
>     39  #else
>     40
>   > 41  #include <asm/ticket_spinlock.h>
>     42
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
