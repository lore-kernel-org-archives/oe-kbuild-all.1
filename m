Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0871E314A65
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Aug 2026 06:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786860186; cv=pass; b=TjmSyhfzQdq3h6n0pm9N7tfVfN4tAe15odn+T0KJ11SOCzjvxNjt8LY02nStrMO3i4DrhsDQm0gGcfxpUk1CRvgQjxvj+rUoObZZMpdxrdo4YvhWkgcqjeqkRe1ij1lUEq2P8FoIsFlMM/LDbldGjI/CGrmwDgzKmXEPJPR7f64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786860186; c=relaxed/simple;
	bh=fMqshKK4N9+kLimfhd3AaLyQDJKwvZfh/cEeDasbnH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gLKGCWLgvgGGHMiWo8K7fngiyEcApVBixZulmYUewtBqEHPszJQx4v8ghy8ZnfTRc2xrZxc4d1igd6KfePwrlvTDk8PflCUrzQiGZ21VE6ysNawP8/Mtg9/YenS323OK6UOeyFKVPk1lwHAy1bbMLYuTFhAod5azlXZ78PSLa8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K86FwScM; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K86FwScM"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b2aa3be376so1789692e87.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Aug 2026 23:03:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786860183; cv=none;
        d=google.com; s=arc-20260327;
        b=gcWzO8ztZ74of/dbJU2UyatjeNX9nJxsvavy3EpTrCmYSSjoqBPIDcmMIP6QnbMXaB
         uPg0UIgG/4+HK4AsJjm1q/LdAmpAI0wNhs8JzwY2d18iF+GvyJCzGgmTDYRsLRTKip/0
         Zu3SV9hXuugQGe8n/bhNJsOXUTjvh9AKryeaCGlLVIqIvJB97RNiRnqeCjpp4BOuyeZL
         CXs/a6vRA5FBS0kbXhapbTJ/SC4BEPV/CQgWMZYK4+UTYyzHjn3n2A/UNgIZddUqxiuW
         XMQYsgyUZ7JiCUyV7K+VwSlSfPFaPy+sFegENOkASEwbv/eFAEum0n2tYi7HLDA2y9Ko
         PgJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7jRLj8ZdcWGdENRIS0xk6pRtOjjVqR8rCIRjuNpVn6M=;
        fh=2VrYdDIpI+xMHL7lXKNqFnbsvcWExhlxciVN6nMKDnI=;
        b=LR3JoRXz7Jg5J2j+JGvrpf55caMCxn5Pox84/9vRlFwgHeaeWwrZrrnVlwZLHkcafQ
         2mPJe/l9Vp0QN7Yctv6OKI5a6rT7fWu60SUIiiR4BpyA9/o0vi8wClXq6UApaT1/RrIX
         Ohn8GlZm89jn6aZER+Rnmy+ubCgM0Yj4+HzXI16ILWNHNvlWga4+Jp7WvWy5QMZmQfHp
         XfitbjqIkzcKhyTx/qz9KAMXWLZ1BPHnixPtFVqIZnXB3n3MaHyGJoZRs28qZPcGWe76
         nHC628dWdzSBR5r9HuuDXV75WTUURwiQkqY/6E8rFwTKQDV6CbUk8q6O4Ftaow394J5G
         o3IA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786860183; x=1787464983; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7jRLj8ZdcWGdENRIS0xk6pRtOjjVqR8rCIRjuNpVn6M=;
        b=K86FwScMOxeyZv82enL/8QPw6eLlTDxlYO4oX0xqrXgA4/b+5/A/LdKDaNfbNq6W/P
         Q21BOY7yKdPtXXnjfoIP4YsKBDAgLrmnMf5x7OC69eaAZoZxWkTyZh4PA8T4d///ZDB4
         8P5ptYROheVh6NNlK3AutW32xQGokL0TG6ipjF2MKwqE+w4YORDt+uIDtx0RMAxc1Ect
         bxiMzhQ1KDWBT5laIuhzinvSYYEdoES7KTnhB0Vv1gJ6jH+hquSiiXFO1AMFjJKuYtU8
         e30JsS06iw9K6PRAc0UNlMGX8upSXyS0Ei9PiLcuDhu4f3SvY2JYj23nJj4iRrBnh6ES
         KUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786860183; x=1787464983;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7jRLj8ZdcWGdENRIS0xk6pRtOjjVqR8rCIRjuNpVn6M=;
        b=MvszZ3CiOFcMvz9OcRNMfP4tdjtO42QBu5i2jHTZ9GS0yczFLFfw36AdDw2E07f0Jq
         00+MFWGLCzk4FNSpYE5S2ectj3ZJMmAUYc7gBEzspPfN+0WNb1vQMD+lPI/XGFJ8D3vD
         CnTVBOy/ofNog22KcB+t0FNa1DMmQDXmxSaFza843rnSL2dXrslkQPtIermE5byOJE8h
         U4q3RcrG91kMrgsSIBeP1+zJC5e9ndP9gY5gS68vBFoqxeIoNBXa3DPSoi8kUxRetoGK
         OO/Ks7EIedp6zCiwWW0oK58BLLHu2UWGcIG4WSjRYocx24Eq+ttHVxGB9B+XCHV4WG4m
         48XQ==
X-Forwarded-Encrypted: i=1; AHgh+RrbSFEQBZMwoRzptiRpnf6ZOmUZhg2Nt3oB0LobPr/k/FynOYhMVonxVcrvRODVO034zV7fH1YTyf3P8S1p@lists.linux.dev
X-Gm-Message-State: AOJu0Ywh2OPGqcSvu65iOskTOB8h6//l4arJanLfZqGMpmt9rnq0cI/8
	gGNGEy4n/oCwQvoTBQkiftGITAdmqDyuZWilhp0G6+v54eFJuxgM+yYl4YgiuZ8IG3X33Mnn5Cf
	LWOiDJA/J28oqYJXkODf7nFRC/qfFnxE=
X-Gm-Gg: AR+sD12bTAgg1VlTjJPUPDyPzRamFWYbWkF7kZqMmm8GuAXN5CbwV2VfEe6FtXItVP6
	QNI1rP05qLQBBlww5QHtPxCSSrbY3J3+YBrzoS/8VImyrNSOX/R/Aig/+Kdap8G+oQzDvrWOjsH
	64nA7tVHwChsdQ/ng0Nwj3HgduO6c5K2YuClRrfX8sXve4Z2fAH896K3BK2yaY2VltZmYD7AFUq
	s+25cR+Hg5wuksPKiI2FholmkR/Yfbxpkd3jAYlBZPaf/b9kRPaaM7Tq2sU2bUgb91LqdF5iZBA
	Lh138k00twPV8JJIdw3rMNKVY89HyTd0V2nJNYRv+GClpnbTB4/tVw==
X-Received: by 2002:a05:6512:138c:b0:5b4:58ba:dcea with SMTP id
 2adb3069b0e04-5b459146dd2mr2799984e87.49.1786860182795; Sat, 15 Aug 2026
 23:03:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260723143908.4019-1-maimon.sagi@gmail.com> <202608160048.0KcqzO98-lkp@intel.com>
In-Reply-To: <202608160048.0KcqzO98-lkp@intel.com>
From: Sagi Maimon <maimon.sagi@gmail.com>
Date: Sun, 16 Aug 2026 09:02:37 +0300
X-Gm-Features: AcwNN1Upq7mcZbEwPOwlm_zt8_kPg-udjL_o5jbO8F9JkoVSJrXgl7UXIZBv2YA
Message-ID: <CAMuE1bE-a2EM70nx_6u-Tm5WskK8=afSdKbG9oH+csYpRzPdPA@mail.gmail.com>
Subject: Re: [PATCH v6] ptp: ocp: add CPLD ISP support for ADVA TimeCard X1
To: kernel test robot <lkp@intel.com>
Cc: jonathan.lemon@gmail.com, vadim.fedorenko@linux.dev, 
	richardcochran@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 16, 2026 at 1:54=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Sagi,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on net-next/main]
> [also build test WARNING on net/main linus/master v7.2-rc7 next-20260814]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Sagi-Maimon/ptp-oc=
p-add-CPLD-ISP-support-for-ADVA-TimeCard-X1/20260813-075719
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20260723143908.4019-1-maimon.sag=
i%40gmail.com
> patch subject: [PATCH v6] ptp: ocp: add CPLD ISP support for ADVA TimeCar=
d X1
> compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca79=
33e47d3a3451d81e72ac174dcb5aa28b59d1)
> docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
> reproduce: (https://download.01.org/0day-ci/archive/20260816/202608160048=
.0KcqzO98-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202608160048.0KcqzO98-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interfac=
e num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times:=
 Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; Documentation/AB=
I/testing/sysfs-driver-hid-lenovo-go-s:234
>    WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interfac=
e num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 =
times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; Documentat=
ion/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
>    WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interfac=
e num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined=
 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; Documen=
tation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
>    WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interfac=
e num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is d=
efined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; D=
ocumentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261
>    Documentation/ABI/testing/sysfs-timecard:14: ERROR: Unexpected indenta=
tion. [docutils]
> >> Documentation/ABI/testing/sysfs-timecard:14: WARNING: Block quote ends=
 without a blank line; unexpected unindent. [docutils]
>    Documentation/ABI/testing/sysfs-timecard:14: ERROR: Unexpected indenta=
tion. [docutils]
>    WARNING: ./block/blk-map.c:366 Excess function parameter 'op' descript=
ion in 'bio_copy_kern'
>    Documentation/driver-api/basics:42: ./kernel/time/time.c:370: WARNING:=
 Duplicate C declaration, also defined at driver-api/basics:436.
>    Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const u=
nsigned long j)'. [duplicate_declaration.c]
>    Documentation/driver-api/basics:42: ./kernel/time/time.c:393: WARNING:=
 Duplicate C declaration, also defined at driver-api/basics:453.
>
>
> vim +14 Documentation/ABI/testing/sysfs-timecard
>
>   > 14  What:           /sys/class/timecard/ocpN/cpld_i2c_xfer
>     15  Date:           July 2026
>     16  Contact:        Sagi Maimon <sagi.maimon@adva.com>
>     17  Description:    (RW) Binary sysfs attribute providing a raw I2C p=
assthrough to
>     18                  the CPLD and I2C mux on ADVA x1 TAP boards.  Only=
 present on
>     19                  that board variant.
>     20
>     21                  Each write initiates one I2C transaction.  The wr=
ite payload
>     22                  must be exactly four header bytes followed by the=
 write data:
>     23
>     24                    Byte 0: slave address (only 0x40 and 0x74 are p=
ermitted)
>     25                    Byte 1: number of bytes to write (0..67)
>     26                    Byte 2: number of bytes to read back (0..20)
>     27                    Byte 3: flags
>     28                              bit 0 - suppress the repeated START b=
efore the
>     29                                      read segment (I2C_M_NOSTART);=
 only valid
>     30                                      when both write and read leng=
ths are
>     31                                      non-zero
>     32                    Bytes 4..: write data (write_len bytes)
>     33
>     34                  A subsequent read() returns:
>     35
>     36                    Byte 0: status (0 =3D success, positive errno o=
n error)
>     37                    Bytes 1..: read data (read_len bytes), present =
only when
>     38                               status is 0 and read_len > 0
>     39
>     40                  The write and read portions of the sysfs file sha=
re a single
>     41                  per-device response buffer protected by a mutex; =
a single
>     42                  open() / write() / read() sequence must be used t=
o avoid
>     43                  data races between concurrent users.
>     44
>     45                  Only slave addresses 0x40 (Lattice CPLD) and 0x74=
 (PCA9548
>     46                  I2C mux) are accepted; all others return EPERM.
>     47
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
This report is against v6 (20260723143908.4019-1-maimon.sagi@gmail.com).
The cpld_i2c_xfer attribute it flags was dropped after that revision; the
current posting is v11:

  https://lore.kernel.org/netdev/20260811135720.109580-1-maimon.sagi@gmail.=
com/

I checked v11's sysfs-timecard through the ABI parser and docutils - no
indentation warnings.
