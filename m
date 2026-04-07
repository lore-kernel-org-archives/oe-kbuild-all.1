Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A992D309DCF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 08:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775550660; cv=none; b=gcxx9IMRut8lQ9UaZsMQwEvPdTsJ0JAM4LESF74kZaYz4l6uQoMk3S+hVMckrUM8knPuHDuiiIRiCVlhwMZFqpzYNfIIK54V+g3UdJjkU6cyptualB6KQXFrRWe0/6ZbKHbJ+TFZeJKeC+3PfVKyhdG5KhZdHO3mU1e6oTrh0Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775550660; c=relaxed/simple;
	bh=NN+a9rcn6PHbFVkHq0Sk764OiCueIbFSBYvIhddlGAs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LhJYS+ovFL6e64TkjtovRwGQUgjrpU/YUSNpHWy8qSeFZQq4Le1kT2y3WDV93CRa5TAgEgGQKydTM88uaySfn5J1rSzC9aYkw9/ZBih97SWRkhjZ3ujVJj8QwdHWbmZB7NnA2/Yt6q9GV4M8tm6ONPxq/AqIX+hTZQI+tBDq+DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U5F2ppOI; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U5F2ppOI"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-488ac1434f0so10677305e9.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 07 Apr 2026 01:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775550657; x=1776155457; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MpuKSlq5BeIYsEI8AYaOQOt5sLhXPx0Eq4YETxx4GJU=;
        b=U5F2ppOIr4pYMime/nlc5toYecJp8qeYjIIK3u5XbzxlsmPByA4vxrrW96Rm+EOvTZ
         JUKzsyPX8PXjiqfkcUiQCObMijUHxEXpdlNyDNLE1FlrykAQlp5rzFtNIbZrh6IT2ufq
         kbru2G7DJkEJxW2/syX2ICvSKdfs1lrpvOnk8iKEcGSG7EHF/CPzExMy3/cHDUbnlean
         lf2lpT+t1ZpImRJdYqBVekA3forifMaobJsIu/E0aO18lmEP26DlSdYywgszNQFpEnI+
         y4xnCvxyCF1vmNNJFqMMYfREm5OuGMDlJuLbutTHaTkASJcc5LSNYM8/h4Clsy++IfCm
         NMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550657; x=1776155457;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MpuKSlq5BeIYsEI8AYaOQOt5sLhXPx0Eq4YETxx4GJU=;
        b=Ro9Dp+CMPZr7db2e+BgzikwE0qggqAo6JxKPLz/4fFYrcs1FcxJ5xN4z2b2euPuQo0
         zBUhl9ZhCgg0zI4p2dWls9Saj8YIvGqDneup6jJchjpRsTRgTCQqn9BwNJgvd0wxpCHt
         Xq9Bv4lgG1QOROi+c9OGevgI6lGZpZV1kpNm2nS27PzJomMp/5UjiHS/EHkQkJ4c6no/
         rch7c12fNn7SdFgFH5gywE0OcGDiKWFmPIxwAhGv6W7QYfZZ5ROwN5GXM44SNCUytjbe
         YXKNR+NlYiovnkmQ5TU5PWfBvtfr4Bjw2lnjGQ0e9QOUYfbdl+jt3wV2c18UBYZEEhne
         bN+w==
X-Forwarded-Encrypted: i=1; AJvYcCWB0f034VQ5L/PzsWBUzUnvG5M2W3ZHnGxEXZdmJ26sqyMiib/cAqFwuypU1ygcrF8YszkHnr8NPGQqQcVv@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1Z7vZVnDz7l9gj3W4Jwdx4nbxmIgTWzdo8POOcOIT9x59xTlD
	803qj1X50X/HRutxXq9r9ePJbxMuIUGq/CU31aGVQe7RalzsReHRa5Bfo8DnSIKp8uWFLW/y3Pk
	cYPb3ConNd6sxGsejvg==
X-Received: from wrbdm12.prod.google.com ([2002:a05:6000:bcc:b0:43c:fed3:b106])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4752:b0:488:7ff5:2c67 with SMTP id 5b1f17b1804b1-4889976ea80mr228564215e9.12.1775550656834;
 Tue, 07 Apr 2026 01:30:56 -0700 (PDT)
Date: Tue, 7 Apr 2026 08:30:55 +0000
In-Reply-To: <202604051027.NPt0H2Dy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202604051027.NPt0H2Dy-lkp@intel.com>
Message-ID: <adTAvyb_tRD6jDzX@google.com>
Subject: Re: error: kernel-address sanitizer is not supported for this target
From: Alice Ryhl <aliceryhl@google.com>
To: kernel test robot <lkp@intel.com>
Cc: Christian Schrrefl <chrisi.schrefl@gmail.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"

On Tue, Apr 07, 2026 at 11:58:00AM +0800, kernel test robot wrote:
> Hi Christian,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   3aae9383f42f687221c011d7ee87529398e826b3
> commit: ccb8ce526807fcbd4578d6619100d8ec48769ea8 ARM: 9441/1: rust: Enable Rust support for ARMv7
> date:   1 year ago
> config: arm-randconfig-r061-20260405 (https://download.01.org/0day-ci/archive/20260405/202604051027.NPt0H2Dy-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c80443cd37b2e2788cba67ffa180a6331e5f0791)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604051027.NPt0H2Dy-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: ccb8ce526807 ("ARM: 9441/1: rust: Enable Rust support for ARMv7")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604051027.NPt0H2Dy-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    scripts/dtc/dtc-lexer.lex.c:630:12: warning: variable 'dts_version' set but not used [-Wunused-but-set-global]
>    630 | static int dts_version = 1;
>    |            ^
>    1 warning generated.
>    scripts/sorttable.c:399:12: warning: variable 'long_size' set but not used [-Wunused-but-set-global]
>    399 | static int long_size;
>    |            ^
>    1 warning generated.
>    In file included from <built-in>:3:
>    In file included from include/linux/compiler_types.h:171:
>    include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
>    28 | #define __SANITIZE_ADDRESS__
>    |         ^
>    <built-in>:367:9: note: previous definition is here
>    367 | #define __SANITIZE_ADDRESS__ 1
>    |         ^
> >> error: kernel-address sanitizer is not supported for this target

Like [1], this would probably be fixed by moving away from the linux
target, as kernel-address is a bare-metal only sanitizer.

[1]: https://lore.kernel.org/all/acUGAsjYvNvTEO92@google.com/
