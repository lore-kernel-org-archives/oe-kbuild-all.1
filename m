Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7DD15494
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 20:49:32 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-41513d2cca7so123481cf.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 13:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695674971; x=1696279771; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pK8VYz8FLmFdqFr7YXv95qBS2lVcAXB+4HwVM7h/HKA=;
        b=xzkDKeVgJv2Vdl4hI4ITiKFdQXtsWHIKIH+4zrpn73pDMqo1QbGpwtuoZSxOCo5gbV
         pn3DEAtMJPgPScf5dKJmPVNTolC0P9V91iCyIA8lcSSplK+lj3HnfJvsgjNCfIGfCEwO
         s0EUxXhxyn6SnShi4+sGRXs/6/dn9NaAcHZ4xL8XrYIeUPCRvVmLZlRrUnEktcXR/dhg
         aQPJRF2SVaXcsOhgeGtXbZLGFw4e5T5Xf6RWySfb/PvqNp5zcv37alJIRzhIg7Mhwz73
         vWsjZt6gfupStrzBTGEtUQE9ARu9Fmztn1A6D4hidvBxr5RooZKpAIPbN7j9ITXV1KO2
         YNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695674971; x=1696279771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pK8VYz8FLmFdqFr7YXv95qBS2lVcAXB+4HwVM7h/HKA=;
        b=hU5H5gz62jsUX4Kd649w/Nx2y2gbn++5EmwjE7R50AZya3xmrHGAwaSe3K6U/XdB5a
         4dVjsE9WpWmEbmtm536Dexrvp7Ccy3afSjxAtmcClgCd8zrcg2pYMHP9FqQv+uiV10xa
         cGZ9XqOV1kg3lQ4J0AY9t10+dii3/NWKh67i/VB/9WNlzZeCjRyubtDfzS0bqRQJ4st6
         WfsHEaYagD4M3VeWo0nf2v5AqpmK1hYiMK3Weu6+r4P6f3fm8anvEs/zq2aJ1ysauUiV
         lynihgAk3asizwSmNIQ5vCptuIGhMqP2t1EQvf+/av883zjLYUvB/OJZ6dLyuh42Nif+
         ERFA==
X-Gm-Message-State: AOJu0YyuyHUhqo2z09/kuubYx9YrsGCAvqIXK4PJ1ga+lwtKiv0acmMw
	NolKORji7Ls8P/a5ePCgIWyIHgcvcf3utGqzB7kKHk6dDNmtmNAM66WHKw==
X-Google-Smtp-Source: AGHT+IGhl8Ns5Vxcp8XdHuBSBPP9EgT/tJ+ospWL6ZjEU7IYKkvFtJWSoe0GY+J86CRHtGtmGxqjBQ6gJlDBv4MlsDI=
X-Received: by 2002:a05:622a:100f:b0:417:9238:5a30 with SMTP id
 d15-20020a05622a100f00b0041792385a30mr23279qte.29.1695674971183; Mon, 25 Sep
 2023 13:49:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2309252107030.3165@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2309252107030.3165@hadrien>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 25 Sep 2023 13:49:17 -0700
Message-ID: <CABXOdTeoq8DuKkQoOvHSRJ9txxpKgJkAZv7vMzACTY6edi0=uw@mail.gmail.com>
Subject: Re: [chrome-os:chromeos-5.4 32/34] drivers/iio/industrialio-core.c:1851:2-8:
 preceding lock on line 1848 (fwd)
To: Julia Lawall <julia.lawall@inria.fr>
Cc: cros-kernel-buildreports@googlegroups.com, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julia,

On Mon, Sep 25, 2023 at 12:08=E2=80=AFPM Julia Lawall <julia.lawall@inria.f=
r> wrote:
>
> Is it intended to hold the lock when successfully exiting the function?
> If so, perhaps that information could be added to the predecing comment.
>

This code originates from the upstream kernel, and it indeed locks the
mutex in one function and releases it in another. Should the functions
be tagged with __acquires() and __releases() ? If so, that should
probably be done in the upstream kernel.

Thanks,
Guenter

> julia
>
> ---------- Forwarded message ----------
> Date: Tue, 26 Sep 2023 02:24:25 +0800
> From: kernel test robot <lkp@intel.com>
> To: oe-kbuild@lists.linux.dev
> Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
> Subject: [chrome-os:chromeos-5.4 32/34]
>     drivers/iio/industrialio-core.c:1851:2-8: preceding lock on line 1848
>
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> TO: cros-kernel-buildreports@googlegroups.com
> TO: Guenter Roeck <groeck@google.com>
>
> tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel c=
hromeos-5.4
> head:   47a5bab6041a6e6381156a2dfe5781ded89ffa63
> commit: 16382e4ab8163f25b527ef0982887c66a9042a42 [32/34] BACKPORT: iio: c=
ore: introduce iio_device_{claim|release}_buffer_mode() APIs
> :::::: branch date: 2 days ago
> :::::: commit date: 4 days ago
> config: x86_64-randconfig-101-20230925 (https://download.01.org/0day-ci/a=
rchive/20230926/202309260246.FFJPzbf1-lkp@intel.com/config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230926/202309260246=
.FFJPzbf1-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Julia Lawall <julia.lawall@inria.fr>
> | Closes: https://lore.kernel.org/r/202309260246.FFJPzbf1-lkp@intel.com/
>
> cocci warnings: (new ones prefixed by >>)
> >> drivers/iio/industrialio-core.c:1851:2-8: preceding lock on line 1848
>
> vim +1851 drivers/iio/industrialio-core.c
>
> 08a33805518e784 Alison Schofield 2016-03-09  1834
> 16382e4ab8163f2 Nuno S=C3=A1          2022-10-12  1835  /**
> 16382e4ab8163f2 Nuno S=C3=A1          2022-10-12  1836   * iio_device_cla=
im_buffer_mode - Keep device in buffer mode
> 16382e4ab8163f2 Nuno S=C3=A1          2022-10-12  1837   * @indio_dev:   =
    the iio_dev associated with the device
> 16382e4ab8163f2 Nuno S=C3=A1          2022-10-12  1838   *
> 16382e4ab8163f2 Nuno S=C3=A1          2022-10-12  1839   * If the device =
is in buffer mode it is guaranteed to stay
> 16382e4ab8163f2 Nuno S=C3=A1          2022-10-12  1840   * that way until=
 iio_device_release_buffer_mode() is called.
> 16382e4ab8163f2 Nuno S=C3=A1          2022-10-12  1841   *
> 16382e4ab8163f2 Nuno S=C3=A1          2022-10-12  1842   * Use with iio_d=
evice_release_buffer_mode().
> 16382e4ab8163f2 Nuno S=C3=A1          2022-10-12  1843   *
> 16382e4ab8163f2 Nuno S=C3=A1          2022-10-12  1844   * Returns: 0 on =
success, -EBUSY on failure.
> 16382e4ab8163f2 Nuno S=C3=A1          2022-10-12  1845   */
> 16382e4ab8163f2 Nuno S=C3=A1          2022-10-12  1846  int iio_device_cl=
aim_buffer_mode(struct iio_dev *indio_dev)
> 16382e4ab8163f2 Nuno S=C3=A1          2022-10-12  1847  {
> 16382e4ab8163f2 Nuno S=C3=A1          2022-10-12 @1848       mutex_lock(&=
indio_dev->mlock);
> 16382e4ab8163f2 Nuno S=C3=A1          2022-10-12  1849
> 16382e4ab8163f2 Nuno S=C3=A1          2022-10-12  1850       if (iio_buff=
er_enabled(indio_dev))
> 16382e4ab8163f2 Nuno S=C3=A1          2022-10-12 @1851               retu=
rn 0;
> 16382e4ab8163f2 Nuno S=C3=A1          2022-10-12  1852
> 16382e4ab8163f2 Nuno S=C3=A1          2022-10-12  1853       mutex_unlock=
(&indio_dev->mlock);
> 16382e4ab8163f2 Nuno S=C3=A1          2022-10-12  1854       return -EBUS=
Y;
> 16382e4ab8163f2 Nuno S=C3=A1          2022-10-12  1855  }
> 16382e4ab8163f2 Nuno S=C3=A1          2022-10-12  1856  EXPORT_SYMBOL_GPL=
(iio_device_claim_buffer_mode);
> 16382e4ab8163f2 Nuno S=C3=A1          2022-10-12  1857
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
