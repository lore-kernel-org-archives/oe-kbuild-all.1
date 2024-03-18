Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B3B2374C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Mar 2024 07:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710748526; cv=none; b=UR8XRRia57ZEo5PPSYqTcBtytHIBOP9O+TA7WpfTrJ1ZWxUl6sz2zaNM05cwDsSrqVSOIT9KKnGXZ4bmZ1l2TsuwZnGAHA5YRKt3An/rDX1VK8CSicBDzWVCzuBcjbhc52vpVRE0s8nLKj4dWBJHU8D3cU/kHLEalvhfahVOlb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710748526; c=relaxed/simple;
	bh=oWFse9ekt4BN9hGStBO3ysp4OZBQ/mn4vNBp7g52xSg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=aeFDNe30KkvR0w0u01xHWUZUOh9FOnSsavIb4PPtMUYvbhTMMJY5CtnV0S98Kwq0Huoxnbd43Lwbkp7oJU7B6qFxmJWqUu0mPWwAW7sIPY3IitppvzUL4zkI7GjS2V4axinnCDCFxJTOnqFvMZRWl6eMUQ7PQokegRYAro6rHS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=kNtoqHs6; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="kNtoqHs6"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a4675aaa2e8so452236466b.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Mar 2024 00:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1710748522; x=1711353322; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0wM7gb+uYqIRwVS3G2mY0QK2Uz/D6Ti8QCtsKMjfqM=;
        b=kNtoqHs6+MwpGbygQAEvuDE5xJx4/b/pPZyny2sqMUr+63nEX71eR7j/TVB48/jmDn
         yww6Qj19WWxqdHJQfe0jSuHd16+mbRw9Dn8S15ySpZ8WAsvQ0g3ZnYKV7+PCRdxRNfTr
         UY6SECor72iFwagYMY8pAOd5wWvXLnqXNCqVSAk9A8VA5w8DKxhR5UouiADK4kwCoEc9
         9clN0lM3pSsN9iwLhPeWkZnt+Ta8GQQnyiBplwchiB8MdFqAmMqx8hVRL/0EZNwtOPmf
         uI5Ng//+dMsXdKjBrgKdxIehIf/yLWnz3bITnJ4sCA8EcSf8LYLgpMj5WFFiJNgUVfTv
         DDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710748522; x=1711353322;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I0wM7gb+uYqIRwVS3G2mY0QK2Uz/D6Ti8QCtsKMjfqM=;
        b=EARd1iaXqG83quDYDpPOcWhW6m4XunHnKXVkwNVFfUOKZ0ChYjehua/iXW5Lgo96uW
         foHtdsjErzoZ8RGlx1SYDHMeaJLSM1giUOjNWPShDw8h6qOeqPWMe/ao6QMw2U4yQlNI
         GFxJic0QWRlv3bKtiZZYgeo6yG2r+qXjthIbLg3UBwavYR+oda4sNlsoUyquH/XOWIZy
         bJrpALfW3jm3KsV6ijpXU9v348u7K86jNlaIgX+f5ENWaEXwLv4ZFpo8ilCscHYV4ypJ
         eK8dwY2jAXArACwoLWfuOIxBO3c0JuU8ZB2VUkS4raAXygRWSlsWbxJ4eKLIiGgt+hWd
         WTog==
X-Gm-Message-State: AOJu0Ywv5tHf2iKFM6rP8fPCZVK95Ts6wsDsinN91i9k3RHHRmlnOCuj
	c1VKm8hlJGsUHiJu/bpLLs/FELDPEDcgv2uPHR5YSztC5aqSnIGnQTwx2kOnm6A=
X-Google-Smtp-Source: AGHT+IGGtm5WZgLzsC1Q2ueS2Uq2APfDGSbekxZp76Rh22abzFr7/qjGZFERQdIYNyt7IAcyPcDqMw==
X-Received: by 2002:a17:906:acf:b0:a46:7780:bdb3 with SMTP id z15-20020a1709060acf00b00a467780bdb3mr6010896ejf.53.1710748521961;
        Mon, 18 Mar 2024 00:55:21 -0700 (PDT)
Received: from localhost (046125249120.public.t-mobile.at. [46.125.249.120])
        by smtp.gmail.com with ESMTPSA id l3-20020a1709061c4300b00a46a3ad035esm2545440ejg.179.2024.03.18.00.55.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 00:55:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 Mar 2024 08:55:20 +0100
Message-Id: <CZWPQKXWWDJF.31PYCW52I63O6@fairphone.com>
Subject: Re: ERROR: modpost: "devm_drm_of_get_bridge"
 [drivers/usb/typec/mux/ptn36502.ko] undefined!
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "kernel test robot" <lkp@intel.com>
Cc: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Heikki
 Krogerus" <heikki.krogerus@linux.intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>
X-Mailer: aerc 0.15.2
References: <202403161449.bV9MUszO-lkp@intel.com>
In-Reply-To: <202403161449.bV9MUszO-lkp@intel.com>

On Sat Mar 16, 2024 at 7:23 AM CET, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   66a27abac311a30edbbb65fe8c41ff1b13876faa
> commit: 8e99dc783648e5e663494434544bdc5160522de3 usb: typec: add support =
for PTN36502 redriver
> date:   5 months ago
> config: riscv-randconfig-r064-20240311 (https://download.01.org/0day-ci/a=
rchive/20240316/202403161449.bV9MUszO-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240316/202403161449.bV9MUszO-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403161449.bV9MUszO-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/locktort=
ure.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/rcutorture.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/rcuscale.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/refscale.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/torture.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfsv4.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_ucs2_utils.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/smb/common/cifs_arc4=
.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/smb/common/cifs_md4.=
o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/drm_pan=
el_orientation_quirks.o
> ERROR: modpost: "devm_drm_of_get_bridge" [drivers/usb/typec/mux/nb7vpq904=
m.ko] undefined!
> >> ERROR: modpost: "devm_drm_of_get_bridge" [drivers/usb/typec/mux/ptn365=
02.ko] undefined!

This should be fixed by the patch I sent a while ago:
https://lore.kernel.org/lkml/20240111-drm-panel-bridge-fixup-v1-1-e06292f6f=
500@fairphone.com/

Regards
Luca
