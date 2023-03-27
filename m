Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F697622
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Mar 2023 04:03:32 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id cf7so8824605ybb.5
        for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Mar 2023 21:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679889811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44uUxFYwsArqBtqy4mYcm+gQ9NS3Dy6uSJ7usODITCI=;
        b=StUxz0jVABbeM1hEm5fyHaEzT/KlPApejjTT9AtYMc9PamUXeMAV1pb0DxvI1ttzlE
         r6yQuNylLjQl2LfQJ7CA3UA3yk1S8KwE5LMGwiTjGo9JZSlcyCYrKz+fuGEJ1zziVPUq
         5fa3FG+Y+XIYBzzwX1sipVVkUZQnqwstXt0PPSzqK1L82tc5P1RDQErHhxEKLWgN6mxP
         aRdHYzhBgb+emVwUGD4d/CL+dgHYY1AYpZa5mQwmS7WBn5vYJ0/+ixg8HOzZIk5LAUK4
         3bRnsJrnFyM3O8LJbTfswUr+21f2WJ7VZoZgguPO33667hXQsQmNScsi6qjUwT+41Z6l
         A+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679889811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=44uUxFYwsArqBtqy4mYcm+gQ9NS3Dy6uSJ7usODITCI=;
        b=kr4jgWQmPcSLWiMmLx57SJcFpQdmt6XZPGoBsoRYYcfiUgIbMb4tm45UmlFcg4iqsf
         cGck63jpflAO8P8KlQ3Q9FdJohV+0/3uGkfs61uiFHpbemWP0Wm9bGgwdtg3bnSjgg0O
         dy8AaLYb9ZgAgTXbrjV5UiTJxgYqn4dR+wGARIKzQTQS0XVn3iocTHcAd8BLIAAw67I+
         OSmwVA6Qo6Xq+kHUb2WqEHCT5oD5kfkpF6QEZ/VNCddAN4ynCoAOIK768VxymL/SjJeQ
         qYAJud1wMIM6g59b1eetSOABjgqiNg/qZpcFep6xfOt5OGNkU3259ALVNLmE1N634eIW
         ZDhg==
X-Gm-Message-State: AAQBX9dQ2hl56o0/4aZEZcg0KzuhdxP4fOpLCDs682V4WJpG69Gr0RFr
	uVV5ZQd+XSflFwBdMyLzcUZDCX6o9nlvswy3yVwnUg==
X-Google-Smtp-Source: AKy350ZxnkU1qJuXiniK3lhm3Ae6t7cGlvqs4DKooP9FTo5L1afqwypI6CCPtVuiAdGP6q4BI4+HLgMcwtc7XrJTwuo=
X-Received: by 2002:a05:6902:168d:b0:b7b:f02a:919d with SMTP id
 bx13-20020a056902168d00b00b7bf02a919dmr202956ybb.8.1679889811008; Sun, 26 Mar
 2023 21:03:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230326173511.710749-3-joychakr@google.com> <202303270715.w9sMJhIh-lkp@intel.com>
In-Reply-To: <202303270715.w9sMJhIh-lkp@intel.com>
From: Joy Chakraborty <joychakr@google.com>
Date: Mon, 27 Mar 2023 09:33:19 +0530
Message-ID: <CAOSNQF1xc8Bfw2=7+A_hU-EXy7dmG5scUvE6bUYUjzTMvRv_Yw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] spi: dw: Add dma controller capability checks
To: kernel test robot <lkp@intel.com>
Cc: Serge Semin <fancer.lancer@gmail.com>, Mark Brown <broonie@kernel.org>, 
	oe-kbuild-all@lists.linux.dev, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, manugautam@google.com, rohitner@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Serge(y)

On Mon, Mar 27, 2023 at 4:59=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Joy,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on broonie-spi/for-next]
> [also build test WARNING on linus/master v6.3-rc4 next-20230324]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Joy-Chakraborty/sp=
i-dw-Add-32-bpw-support-to-DW-DMA-Controller/20230327-013645
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git f=
or-next
> patch link:    https://lore.kernel.org/r/20230326173511.710749-3-joychakr=
%40google.com
> patch subject: [PATCH v3 2/2] spi: dw: Add dma controller capability chec=
ks
> config: arc-randconfig-s041-20230326 (https://download.01.org/0day-ci/arc=
hive/20230327/202303270715.w9sMJhIh-lkp@intel.com/config)
> compiler: arceb-elf-gcc (GCC) 12.1.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.4-39-gce1a6720-dirty
>         # https://github.com/intel-lab-lkp/linux/commit/9962c1acd23cb0766=
a09948c1bee4f29950b8a96
>         git remote add linux-review https://github.com/intel-lab-lkp/linu=
x
>         git fetch --no-tags linux-review Joy-Chakraborty/spi-dw-Add-32-bp=
w-support-to-DW-DMA-Controller/20230327-013645
>         git checkout 9962c1acd23cb0766a09948c1bee4f29950b8a96
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=
=3Darc olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=
=3Darc SHELL=3D/bin/bash drivers/spi/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303270715.w9sMJhIh-lkp@i=
ntel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> drivers/spi/spi-dw-dma.c:241:56: sparse: sparse: marked inline, but wi=
thout a definition
>
> vim +241 drivers/spi/spi-dw-dma.c

Indeed I have marked it inline in the function prototype.
Removing the same and sending a V4 patch.

>
> f89a6d8f43ebe9 drivers/spi/spi-dw-mid.c Andy Shevchenko 2015-03-09  240
> 57784411728ff4 drivers/spi/spi-dw-dma.c Serge Semin     2020-05-29 @241  =
static enum dma_slave_buswidth dw_spi_dma_convert_width(u8 n_bytes)
> 57784411728ff4 drivers/spi/spi-dw-dma.c Serge Semin     2020-05-29  242  =
{
> 80de96dae70648 drivers/spi/spi-dw-dma.c Joy Chakraborty 2023-03-26  243  =
       switch (n_bytes) {
> 80de96dae70648 drivers/spi/spi-dw-dma.c Joy Chakraborty 2023-03-26  244  =
       case 1:
> e31abce778bc05 drivers/spi/spi-dw-mid.c Andy Shevchenko 2015-03-09  245  =
               return DMA_SLAVE_BUSWIDTH_1_BYTE;
> 80de96dae70648 drivers/spi/spi-dw-dma.c Joy Chakraborty 2023-03-26  246  =
       case 2:
> e31abce778bc05 drivers/spi/spi-dw-mid.c Andy Shevchenko 2015-03-09  247  =
               return DMA_SLAVE_BUSWIDTH_2_BYTES;
> 80de96dae70648 drivers/spi/spi-dw-dma.c Joy Chakraborty 2023-03-26  248  =
       case 3:
> 80de96dae70648 drivers/spi/spi-dw-dma.c Joy Chakraborty 2023-03-26  249  =
       case 4:
> 80de96dae70648 drivers/spi/spi-dw-dma.c Joy Chakraborty 2023-03-26  250  =
               return DMA_SLAVE_BUSWIDTH_4_BYTES;
> 80de96dae70648 drivers/spi/spi-dw-dma.c Joy Chakraborty 2023-03-26  251  =
       default:
> e31abce778bc05 drivers/spi/spi-dw-mid.c Andy Shevchenko 2015-03-09  252  =
               return DMA_SLAVE_BUSWIDTH_UNDEFINED;
> e31abce778bc05 drivers/spi/spi-dw-mid.c Andy Shevchenko 2015-03-09  253  =
       }
> 80de96dae70648 drivers/spi/spi-dw-dma.c Joy Chakraborty 2023-03-26  254  =
}
> e31abce778bc05 drivers/spi/spi-dw-mid.c Andy Shevchenko 2015-03-09  255
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests

Thanks
Joy
