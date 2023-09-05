Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10451DDB6
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Sep 2023 21:28:43 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-402c80b71ecso30155e9.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 05 Sep 2023 14:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693949322; x=1694554122; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CZ3kX2CQT00mL/6FQwYpwdjhVuMH2uh5Bl0oud94Nw=;
        b=E/3wr/EMxZC+UpNgFjSxMLrpdAKYXqiCKzJMNF7MvX6x9Kcznr+Lqkeoac9fkNxF1y
         1qZfNipE2W5qaAaFZSJzdMLyZcsC4gLwQDRCiUi5tgtgQUkEI5XUmAo5jtqu6JkKayFY
         hTGUw1Czns2+dFs3iLgakKH8UDvq8Ln5KB5gSLBmZiwV1wz7gtE4hfAdMvYoYZUsszu6
         CWVw4ET6ktuzSxCyWxA80wcVY4f9jTZzLqI1adYlrrO9CFmCqgVBpkaV0TQbONkEJ8bI
         5Q17W/HKhrXfCu4/H2aa696p9h/YbQ9Odup1UdpTrubOjT6qBzPEzCODTbjxTPQTR4Hz
         xGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693949322; x=1694554122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CZ3kX2CQT00mL/6FQwYpwdjhVuMH2uh5Bl0oud94Nw=;
        b=UsJaqahoc6GAodeMJaeUCFHEgcovhH2autg21QFU4am/DO5OyakVyup6iSiywrT2a5
         0t6Vvzt0Xw5+SOkRNM+yipTE2+ehajuaqyBIeqju+fm08csQG29pDUgMk034/ouir1Uj
         Rgf3d/xy6N3LngkEawB6M3G9+Q5O1fcK5q8eJAPlJW7DZZzXMwu9WpT3bqEH4CMhuUU5
         6Kc46MbCWx9s6f/Yp7bLlpUA0whtOhIh20ysvJEN1BTWlUApnak+QRnnftSeM+/MUgPG
         NvrF5YrFZ6t38EG/LfuMpe/axUd7wwbiX9nmpU2cBdnH861sIxeS9eJqEnq+Xgw7Wtwi
         ZKTw==
X-Gm-Message-State: AOJu0Yy8tmSoUxzG3GZWClBxPwQYcGjMRHU3vdfCRCMdeHIYOG0G44nG
	Knz9BEM1QlcdNj+NeqwBamuP4R+vylzLlspObXj2TA==
X-Google-Smtp-Source: AGHT+IGKtilO06Ooj3UQjZC89LAigRvj+KF34uNITiMRlC7jbwVIS2G4B3Y4TGOJMVg3NNJ25SEF7kYIbITNd9p09Y8=
X-Received: by 2002:a05:600c:3594:b0:3fe:f32f:c57f with SMTP id
 p20-20020a05600c359400b003fef32fc57fmr49434wmq.0.1693949321777; Tue, 05 Sep
 2023 14:28:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202309031144.R5zX4rkR-lkp@intel.com>
In-Reply-To: <202309031144.R5zX4rkR-lkp@intel.com>
From: Doug Anderson <dianders@google.com>
Date: Tue, 5 Sep 2023 14:28:29 -0700
Message-ID: <CAD=FV=UNcqLOzkxisABwZZh_9kVDFA4ncWQEP93nkAFAqfqQeA@mail.gmail.com>
Subject: Re: [chrome-os:chromeos-6.1 1/15] htmldocs: ./include/drm/drm_debugfs.h:93:
 warning: Function parameter or member 'name' not described in 'drm_debugfs_info'
To: kernel test robot <lkp@intel.com>
Cc: cros-kernel-buildreports@googlegroups.com, 
	Guenter Roeck <groeck@google.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Trivial to pick the fix:

https://crrev.com/c/4844343

On Sat, Sep 2, 2023 at 8:21=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel c=
hromeos-6.1
> head:   32ff9025e6a9a3f02840fab8bf2e5a5b059dbe87
> commit: 84649e33ce2c4ecab5b4d753691673cd7c930c22 [1/15] UPSTREAM: drm/deb=
ugfs: create device-centered debugfs functions
> reproduce: (https://download.01.org/0day-ci/archive/20230903/202309031144=
.R5zX4rkR-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309031144.R5zX4rkR-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> ./include/drm/drm_debugfs.h:93: warning: Function parameter or member =
'name' not described in 'drm_debugfs_info'
> >> ./include/drm/drm_debugfs.h:93: warning: Function parameter or member =
'show' not described in 'drm_debugfs_info'
> >> ./include/drm/drm_debugfs.h:93: warning: Function parameter or member =
'driver_features' not described in 'drm_debugfs_info'
> >> ./include/drm/drm_debugfs.h:93: warning: Function parameter or member =
'data' not described in 'drm_debugfs_info'
> >> ./include/drm/drm_debugfs.h:105: warning: Function parameter or member=
 'dev' not described in 'drm_debugfs_entry'
> >> ./include/drm/drm_debugfs.h:105: warning: Function parameter or member=
 'file' not described in 'drm_debugfs_entry'
> >> ./include/drm/drm_debugfs.h:105: warning: Function parameter or member=
 'list' not described in 'drm_debugfs_entry'
>
> vim +93 ./include/drm/drm_debugfs.h
>
>     81
>     82  /**
>     83   * struct drm_debugfs_info - debugfs info list entry
>     84   *
>     85   * This structure represents a debugfs file to be created by the =
drm
>     86   * core.
>     87   */
>     88  struct drm_debugfs_info {
>     89          const char *name;
>     90          int (*show)(struct seq_file*, void*);
>     91          u32 driver_features;
>     92          void *data;
>   > 93  };
>     94
>     95  /**
>     96   * struct drm_debugfs_entry - Per-device debugfs node structure
>     97   *
>     98   * This structure represents a debugfs file, as an instantiation =
of a &struct
>     99   * drm_debugfs_info on a &struct drm_device.
>    100   */
>    101  struct drm_debugfs_entry {
>    102          struct drm_device *dev;
>    103          struct drm_debugfs_info file;
>    104          struct list_head list;
>  > 105  };
>    106
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
> --
> You received this message because you are subscribed to the Google Groups=
 "cros-kernel-buildreports" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to cros-kernel-buildreports+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/cros-kernel-buildreports/202309031144.R5zX4rkR-lkp%40intel.com.
