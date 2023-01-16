Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752141FB4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jan 2023 12:35:26 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id p188so30114099yba.5
        for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jan 2023 04:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/erdhCvJApG5+vMesdd42dNerta3+LyPUExayIGJPz0=;
        b=itZ+gDDTGwuqBx/tze1RvlEJN6u0EwoKQK0i1czQF/cl/UscOfz6YkJegbygVvnrMp
         tydo6HMMV5c7DobR3fHke+4bSyEgulQb0Ew+P7FzMYldQrV4/mZU4KB+y/8DCQzvuy7s
         MUhHh384PCVdpJ3iJPHcLbjwixsAx77cmLWOITqfCSi7LiLAsMmM8lLUqjn9pSBN61xI
         DOXsOIjgDXJkWQuxmXktlp/jOKVXc/MA8YsG3hX0qt328aaEpUEb2w6iE8J2AKtnxr1Q
         AhlcJa+r6B1r21bTWW0Vw0yIyTGxaOowB/tOLoCuveWnmUTZ2givnijP1r6RiIBvW8so
         ZKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/erdhCvJApG5+vMesdd42dNerta3+LyPUExayIGJPz0=;
        b=4bvJtFpx3Jw4XzSb8H6yXWoqzDNXNrE3vCCbIkZtaDnNPjavzDx5U5ezflDo/57F5a
         UHes+qxER3D88YuiAHYbqhFBFWVyX66BO/AuuZYGlwl9Uu1hMq2I1x/k+EBS71GZbccn
         2FgPmpPPrkdH0aWxYx0u9r+XU8jAXy1mfTvE8a3XIDFmJLYPs6lpj6UF4J4bGmot0g2p
         A+6azKG92zDdLyOztEOum1QvXsVIrI9Nh+MDNHzZchzAl6htivKPygTd7mJE1PULbBk7
         M1ILv9hqHuRczNDywOor5AoCgEzCrQrmHMoc33PKkPBPkAkDc7UekzObn9d2sQp76M6X
         U4gg==
X-Gm-Message-State: AFqh2kqDVUXOM63/30Wd2VmGUrqHVdGLWkNKfKiD1VgPhFbFhIOCDXEG
	au0SDhES0Q7ydj0I3pBGvBRlC5haDtk9qNh4lcPJGw==
X-Google-Smtp-Source: AMrXdXt1WAMrSMDgrFvzDatVwEnbHDFT16F4YV0aLDOnGxfs2CR1LL+5Qr5ImSLTYmxCautE2oqiS8pGzCGYY5jDKcQ=
X-Received: by 2002:a25:d08d:0:b0:7ca:9b40:72a7 with SMTP id
 h135-20020a25d08d000000b007ca9b4072a7mr1821610ybg.130.1673872525317; Mon, 16
 Jan 2023 04:35:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230110200255.1218738-2-macroalpha82@gmail.com> <202301111039.dxBiLene-lkp@intel.com>
In-Reply-To: <202301111039.dxBiLene-lkp@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 16 Jan 2023 13:35:13 +0100
Message-ID: <CACRpkdbvsFDDRt1otJcZ-mPdSBecL0cwDSW92YeBGmmyLXee0A@mail.gmail.com>
Subject: Re: [PATCH v8 1/4] drm: of: Add drm_of_get_dsi_bus helper function
To: kernel test robot <lkp@intel.com>
Cc: Chris Morgan <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>, tzimmermann@suse.de, 
	linux-rockchip@lists.infradead.org, robh+dt@kernel.org, 
	thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org, 
	oe-kbuild-all@lists.linux.dev, sam@ravnborg.org, maccraft123mc@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 11, 2023 at 4:01 AM kernel test robot <lkp@intel.com> wrote:

>    126  static inline int
>    127  drm_of_get_data_lanes_count_ep(const struct device_node *port,
>    128                                 int port_reg, int reg,
>    129                                 const unsigned int min,
>    130                                 const unsigned int max)
>    131  {
>    132          return -EINVAL;
>    133  }
>  > 134  struct mipi_dsi_host *drm_of_get_dsi_bus(struct device *dev,
>    135                                           struct mipi_dsi_device_info *info)
>    136  {
>    137          return ERR_PTR(-EINVAL);
>    138  }
>    139  #endif

This needs to be prefixed "static inline" like the function above, then
I bet it works.

Yours,
Linus Walleij
