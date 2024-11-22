Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA72189BA9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 08:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732262817; cv=none; b=hsoHtqD99mybc0gqRDkKfGFOwOJHd+4lAQLlu12VuNWifpw2Fn0+7myyIh8LZAdECKu6BxvN8QcmYBB5MaPB/KIX+gLuVhQwQ176tQ/ZeRrvODdTAXAqlJhTL0vZs78zFjwFnrM3vqz51gc52nIUBJZUkyugy9QxDNgM7/PchUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732262817; c=relaxed/simple;
	bh=Qi4/idXLvnIThje2gN76UzBa1XdNh7XOjU86E3VjFGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qtp2tcXsZjUIY9whJXjxwrHRjVAPESnvySbVUhSJ3HHsOtUxNDRGMiVeO9cSeuetTVd0koH+jfwz0Fl1Rb9lsNPkIgQHh41s5PVHHEb6e7Ez2JrMmkEYaINSxa6PNqnQzKW8/rUCQs4UTPFFWp2l0vH7/XygAhcfWGidbvb9PPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C2s/TmG9; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C2s/TmG9"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-724e7d5d5b2so108285b3a.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 00:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732262814; x=1732867614; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EheqArWCj4tc46f2BqzjXCWprDHEPhu6m5IV043oQTA=;
        b=C2s/TmG9V+yS+L1A7j0IcktFtbCsD0geveRJ0Wi5ccrlgqKOs1JXHHFHkor7QyASiG
         wOmG8NNMoO5na947juJiI2eC9dpgce517NPcG90IFLTP5FEi0QLOyDXkeXO/LH6wt0bl
         Ql0AXB9MPG2hI4hiZZ2qmWRu+FkWfDPYkJimw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732262814; x=1732867614;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EheqArWCj4tc46f2BqzjXCWprDHEPhu6m5IV043oQTA=;
        b=QSofB3WsBLvg5gT5hroBeErn5N3QzRzo8ycXgK5Cm9ZDXVoFwsgy7f5ccBOMjLzk6D
         JMM/49tl+exghHYj4zxdmOcmfFTIqPAShZgrB1mXVfyvJiGiOy5tNVshfmOEoG/q1est
         mxOQfR8juQ12H3DZcDOxDCk8pxXisZ7rO1JFDGgvo9U6qyU+IwddfdNtw5fNnBCMNBPe
         CmX0Y+qsAnhKPA4wGOD3Vp/+TzYiqpIEulzav540NHH8/Xri1LBPdZjYKTf4M7kUcUHY
         aMWrkA+JEvgMtgcwj3l3m49qQ8BRnQ/GfW4t71f4srQIF7HCYVV690jY/l6yjFXRhxNq
         tAgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZFHl80gbMCJIFeYCKPkBrJvvpKsGstEfh/OnVXPdq2moi+/IA9ZVvt5FJVEBjzL7g/fvmo8S7JE8RN3dg@lists.linux.dev
X-Gm-Message-State: AOJu0YzBZl5reQJqATq9t7QTDeOSdOaXMa7uj2BBNv7G6tTEzesiFQa/
	1xEuuwR+YcbI+lLZU+6A3ZvcS52pThPb8w3KBdaxeL1zAeHpBeTyc8lvIlHLVrHPdIqMKNcIu7M
	=
X-Gm-Gg: ASbGncvQiChN+eVjbCILm+WHCT0PW4iyIE/OWuMx1gT18pt5jS30SoY1lPCCrdyqp8l
	VTbaKILSHujkKjTzNvxwwYJlY6avlWgA5yfxd/GXAJI08JYqMVTIsHLA7qOcKmhBZSJI6wLk9di
	VJ39CjQTLonD9iLRz3Fp3uXq8rOKHE0+VGlP3iYeuJK6ylIH9CSvPgv5yppP/1Jvb2gbjMXJOfp
	79DyaFG3AHbt8oMEP1NtmkON83QijzEVu66OofwpaJyUTuD2brvgwdmy4hU/kwnGfAsd2qZoNvX
	uqOZoFL1WNi9NONF
X-Google-Smtp-Source: AGHT+IEdBKAkNDZ4KIpEy9astdGCbA6idcmZHaYInYiLiUydFMeloOIvltIq8HaxV2p3TVX084Mbtg==
X-Received: by 2002:a05:6a00:3ccc:b0:71e:818a:97d9 with SMTP id d2e1a72fcca58-724df3c8151mr2681366b3a.5.1732262814436;
        Fri, 22 Nov 2024 00:06:54 -0800 (PST)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com. [209.85.215.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc3e01afsm1049839a12.58.2024.11.22.00.06.52
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 00:06:53 -0800 (PST)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7eb0bc007edso1254604a12.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 00:06:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXc/qEL00Wwp6uthxTiHUyBbcpp0O21gawSC6FcoxuDB2fFMGBkq7fzxyxfyLm6MdPkrEjM8321ke/9Kai4@lists.linux.dev
X-Received: by 2002:a05:6a21:999d:b0:1db:e328:dd13 with SMTP id
 adf61e73a8af0-1e09e3fe116mr2932241637.11.1732262812168; Fri, 22 Nov 2024
 00:06:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <54307d9c-a9bf-4bc1-b15d-60c5ba53d0ea@stanley.mountain> <Z0A6Rc-HUPcsIw8z@kekkonen.localdomain>
In-Reply-To: <Z0A6Rc-HUPcsIw8z@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 22 Nov 2024 09:06:40 +0100
X-Gmail-Original-Message-ID: <CANiDSCuQFmrPTLTFs0GPJ209EEKN=MCg8cK3xcsxp8c2eEMhVg@mail.gmail.com>
Message-ID: <CANiDSCuQFmrPTLTFs0GPJ209EEKN=MCg8cK3xcsxp8c2eEMhVg@mail.gmail.com>
Subject: Re: drivers/media/pci/intel/ipu-bridge.c:752 ipu_bridge_ivsc_is_ready()
 warn: iterator 'i' not incremented
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi

On Fri, 22 Nov 2024 at 09:01, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Dan,
>
> On Fri, Nov 22, 2024 at 10:45:53AM +0300, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   28eb75e178d389d325f1666e422bc13bbbb9804c
> > commit: 93da10eee90b2ffa4b496dd4a6ea276c57461fb6 media: intel/ipu6: Fix direct dependency Kconfig error
> > config: alpha-randconfig-r072-20241122 (https://download.01.org/0day-ci/archive/20241122/202411221147.N6w23gDo-lkp@intel.com/config)
> > compiler: alpha-linux-gcc (GCC) 14.2.0
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202411221147.N6w23gDo-lkp@intel.com/
> >
> > smatch warnings:
> > drivers/media/pci/intel/ipu-bridge.c:752 ipu_bridge_ivsc_is_ready() warn: iterator 'i' not incremented
> >
> > vim +/i +752 drivers/media/pci/intel/ipu-bridge.c
> >
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  745  static int ipu_bridge_ivsc_is_ready(void)
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  746  {
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  747     struct acpi_device *sensor_adev, *adev;
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  748     struct device *csi_dev;
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  749     bool ready = true;
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  750     unsigned int i;
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  751
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03 @752     for (i = 0; i < ARRAY_SIZE(ipu_supported_sensors); i++) {
> > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  753  #if IS_ENABLED(CONFIG_ACPI)
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  754             const struct ipu_sensor_config *cfg =
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  755                     &ipu_supported_sensors[i];
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  756
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  757             for_each_acpi_dev_match(sensor_adev, cfg->hid, NULL, -1) {
> > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  758  #else
> > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  759             while (true) {
> >                                                                                                         ^^^^^^^^^^^^^^
> >
> > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  760                     sensor_adev = NULL;
> > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  761  #endif
> > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  762                     if (!ACPI_PTR(sensor_adev->status.enabled))
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  763                             continue;
> >
> >
> > These continues make sense in for_each_acpi_dev_match() but not in a while (true) {
> > loop.  We're stuck forever.
>
> The non-ACPI case is there just for the looks... I think what should be
> done is to make the entire loop conditional to CONFIG_ACPI. I can post a
> patch.

I saw your mail after I sent my patch :)
https://patchwork.linuxtv.org/project/linux-media/patch/20241122-fix-ipu-v1-1-246e254cb77c@chromium.org/

If we make the entire loop conditional then we would not compile test the loop.

Regards!



>
> >
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  764
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  765                     adev = ipu_bridge_get_ivsc_acpi_dev(sensor_adev);
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  766                     if (!adev)
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  767                             continue;
> >                                                                                                                         ^^^^^^^^
> >
> >
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  768
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  769                     csi_dev = ipu_bridge_get_ivsc_csi_dev(adev);
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  770                     if (!csi_dev)
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  771                             ready = false;
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  772
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  773                     put_device(csi_dev);
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  774                     acpi_dev_put(adev);
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  775             }
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  776     }
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  777
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  778     return ready;
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  779  }
> >
>
> --
> Kind regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda
