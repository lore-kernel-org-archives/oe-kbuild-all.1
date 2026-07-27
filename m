Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5D93D25D0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jul 2026 19:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785180603; cv=none; b=ozhAD7bZoXMjd0WJ4jeA2QTKK6cBxVHg+Oky5CBiQiAQwUPAl70TxiK15HFlTeVI1BU6L1JG9dEaDhRQ5N0tdzKUaAJMMitjVDbWBQG0X+pY0NO5Z3vR1NzUI6F6DfKSNnR6PkTs7X2G9uvvVax5ez//M1iL886PqTw3UPGOWxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785180603; c=relaxed/simple;
	bh=72hy8hqQj2c6XX4SbkDWqEZ+zz9btq/78rfRqxUZ1Js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OrkiT4jvTSRcvsCVfjcuGg9xTIlBhH0oOJOPS5LTFYkksWReVtLDSY/OF9oRF4BNPOADghiUCqJEkaVAjedS6wg300ctvb2b0kt+DPVquXfaaM3vhUS71EwskfVuv+D+c/LLmKCqUC5osqUW9uAIBbLPiQXrzn1t7xi+91b826Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YkduIBgI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YkduIBgI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 143711F000E9;
	Mon, 27 Jul 2026 19:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785180600;
	bh=G7U3K6sTglMW17idKQBAmKNWEwV1pnWvf30zwRl0nM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YkduIBgIvZ/TnLIXywEcpnNaHML+DCls41pRaYevRI4TXgsbjnNkphICk2UdEod4i
	 gX3qCHdQKbLvlhLnlKVc/dB6DyDvEC9fYMgfYOUwsmGJeJaIQRRGwSBBFJHiC9t2Dq
	 4eqD2ONZ5TY4qGr8oOWt9x6DO3nP78W4hwNbgV+M=
Date: Mon, 27 Jul 2026 21:29:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [char-misc:char-misc-testing 1/1] Diff in
 drivers/android/binder/thread.rs:1296:
Message-ID: <2026072716-tattoo-praying-ad27@gregkh>
References: <202607271720.zYTH7DRy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202607271720.zYTH7DRy-lkp@intel.com>

On Mon, Jul 27, 2026 at 06:01:47PM +0200, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-testing
> head:   0957fbab972a9499626ac457fd924b24491c6315
> commit: 0957fbab972a9499626ac457fd924b24491c6315 [1/1] Merge 7.2-rc5 into char-misc-next
> config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260727/202607271720.zYTH7DRy-lkp@intel.com/config)
> compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
> rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260727/202607271720.zYTH7DRy-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607271720.zYTH7DRy-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    PATH=/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
>    INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
>    /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
>    make: Entering directory '/kbuild/src'
>    make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
> >> Diff in drivers/android/binder/thread.rs:1296:
>                                 ExtendedError::new(info.debug_id as u32, err.reply, source.to_errno());
>                         }
>     
>    -                binder_debug!(
>    -                    FailedTransaction,
>    -                    "transaction {} to {}:{} failed {:?}, code {} size {}-{}",
>    -                    if info.is_reply {
>    -                        "reply"
>    -                    } else if info.is_oneway() {
>    -                        "async"
>    -                    } else {
>    -                        "call"
>    -                    },
>    -                    info.to_pid,
>    -                    info.to_tid,
>    -                    err,
>    -                    info.code,
>    -                    info.data_size,
>    -                    info.offsets_size
>    -                );
>    +                    binder_debug!(
>    +                        FailedTransaction,
>    +                        "transaction {} to {}:{} failed {:?}, code {} size {}-{}",
>    +                        if info.is_reply {
>    +                            "reply"
>    +                        } else if info.is_oneway() {
>    +                            "async"
>    +                        } else {
>    +                            "call"
>    +                        },
>    +                        info.to_pid,
>    +                        info.to_tid,
>    +                        err,
>    +                        info.code,
>    +                        info.data_size,
>    +                        info.offsets_size
>    +                    );
>                     }
>                 }
>             }

I don't understand these warnings, there was a merge in my tree, and I
resolved it, so where does this "diff" come from?

thanks,

greg k-h
