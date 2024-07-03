Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B6417580
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 03:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719977924; cv=none; b=hMRr4veK2UP1s6S+sN0QO0SlnfoUPVwDt27Eb1WYOCCs0DWMXKcNwRCZrKUxKHS2cdTxxal/J7xHkKhM96pzalViWnimcr5rqZoSX5igBTTgTrphz+ujNoG1yS4sOyTvgZ1Izfa7YUczvlBo5OT5GHHih8fe+/5UBtMCXa7nTu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719977924; c=relaxed/simple;
	bh=7E0L3ayeoehe14VRvUWttkG+EMVCsLOVxsjrEwxDQVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pZbf5/4jgvGb3VxKjfc0eviSjpkg+GV0ou1jQPbT0juKDppw4cDaF8avZtDSCieGQg5zWyFHE7Ez+7nBCRtYcIoyuRaWkxdU9Rchfbicmvdk/0icIDOlumE0Tkw17/OZlBkfpLweq7L03WmUtomPXso9ZilBl1dRXHRgX9u9i1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJVg7oa/; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJVg7oa/"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-6eab07ae82bso2954075a12.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 02 Jul 2024 20:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719977923; x=1720582723; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFeNnk9qT4L6sojA/V2elbWNieJhTkbP7b0DlBRhIUI=;
        b=XJVg7oa/hY7SmcABM0LcvRZxpRpaCyTyUcP7EYhVEDccT8ThmexzLGjWXgZaCrXVno
         H1N4cEpzjYGKo6mF1JufVLEK5Sinov7fqrKcj81k9JFQMFiKKFQRk7R7MiOm3sa41e2o
         6+KyclSbTR++m6AS1lTlGiB6h83foeoX3LEE4upynjdxVkpHbdOe5QLHbkc3IHpA1SbX
         4uqTZ+6zuDd8nAoPTVI4aXWF89Rg1o1CuiYNxPeDip/XcCKbyOM/HxopJ91nsD6b1EOO
         wum/HZ1GV3Y63t1gyi/oWaN4pJpHyZUlOMc+gAX8gyO/Gr271Ihj7ggBMMdBfwhBYT6b
         Ph8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719977923; x=1720582723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFeNnk9qT4L6sojA/V2elbWNieJhTkbP7b0DlBRhIUI=;
        b=FWbOAtisag89jsANal8N4aE96M0htjMnA2KAx0VSjZCu0fzMSX5mI63CyJOrKBv73L
         nfRb/8HSDR4UkccdJSkNIn9awzO3q5asM1kWZqhTmB2xayfa91GKni1TEFIuLS+A5pUe
         YTixRa9TmrP5eUfaKy6JF2S1CF5DQ95+n9UWGVRFMWhoz2JrEfQ4l4YS2Pc1PMJ+Y9qi
         5hwBCJT8JHXHuaAihhnerQEID4TOgGB72X6PqQofth83e+nb6NTMg4qyLN89H0CkCipT
         ROCWsPgN+Wa9MMrBd/IaKxsBhEHaO3UP7md9OFk++MOMCUCOXwVgAYHhx0zf8msl5GRB
         gq4Q==
X-Gm-Message-State: AOJu0YxzbXt2vuJSAKY9obYJsDGLe8cPkemhqhcWX8YXI/3MOmlWhEw5
	USPJ1hVtK//RykNnaZTd0diPTqbhZtrJfCXhZ4aNcKmGXLoLsTOYxIpuIFCjqxR5V31m3BCGvtB
	evZ/zzaK0lGgLRXPV21JisMdf/xg=
X-Google-Smtp-Source: AGHT+IHCTFQ21MLy8F4gh2j+EE39qFrRvqnxbUsXOgEM1RbEtVu69eXKJ/eHWsd78WNudCzdSPgbUi3xZlFZvlXHm9s=
X-Received: by 2002:a05:6a20:ce45:b0:1bd:4bb8:6509 with SMTP id
 adf61e73a8af0-1bef6224c5amr9852606637.55.1719977922504; Tue, 02 Jul 2024
 20:38:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240604085401.14733-1-qiang.zhang1211@gmail.com> <202406051045.FpU0Oi69-lkp@intel.com>
In-Reply-To: <202406051045.FpU0Oi69-lkp@intel.com>
From: Z qiang <qiang.zhang1211@gmail.com>
Date: Wed, 3 Jul 2024 11:38:30 +0800
Message-ID: <CALm+0cXzhGBa6v4d=Ky2QWJbfD_9neQJQWPGOp9USAaf=ghsWQ@mail.gmail.com>
Subject: Re: [PATCH v2] rcu-tasks: Fix access non-existent percpu rtpcp
 variable in rcu_tasks_need_gpcb()
To: kernel test robot <lkp@intel.com>, Huacai Chen <chenhuacai@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> Hi Zqiang,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on paulmck-rcu/dev]
> [also build test WARNING on linus/master v6.10-rc2 next-20240604]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Zqiang/rcu-tasks-F=
ix-access-non-existent-percpu-rtpcp-variable-in-rcu_tasks_need_gpcb/2024060=
4-165702
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu=
.git dev
> patch link:    https://lore.kernel.org/r/20240604085401.14733-1-qiang.zha=
ng1211%40gmail.com
> patch subject: [PATCH v2] rcu-tasks: Fix access non-existent percpu rtpcp=
 variable in rcu_tasks_need_gpcb()
> config: loongarch-defconfig (https://download.01.org/0day-ci/archive/2024=
0605/202406051045.FpU0Oi69-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240605/202406051045.FpU0Oi69-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406051045.FpU0Oi69-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):

Hi, Huacai

I don=E2=80=99t know why the following warning appears when compiling with
loongarch64-linux-gcc.

>
> >> kernel/rcu/update.o: warning: objtool: unexpected relocation symbol ty=
pe in .rela.discard.unreachable

A similar problem also occurred at this link:
https://lore.kernel.org/oe-kbuild-all/202406211339.BCuCbD2g-lkp@intel.com/

Is there a patch fix for this warning?

Looking forward to your reply :) .

Thanks
Zqiang

>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
