Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B53C5F7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 20:23:57 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-4a263c4ddbaso223433307b3.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 12:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5qMBCkTmHyzPP8QfthAqRoy8K2nugdtc5xV9Vl27MCg=;
        b=jDBSpT+I/pRdh/uij2oDcq0mk90fpt46h7aZXZhzSuitoitniwXkRPRib8wIZTXXac
         x4fyoZZYsaqaz/hJJ7+YXdc0uwCsdRFgk7QG5SUKj+8/NXMWQEEIHCAzmgiUTjL6Ih4k
         oMKngLyRg91Nk7nplDfXnZv97j92guI4LwHfnMi/FBWNpXzw6wQYSCaAmJaKjcGFkUCr
         9HkxVhIuam2bkjMRe671IVYYSzIwtwpgpJPuQxvg/9Sv+1E48s9QMKQhgx37wj9muWkp
         vJX0Dy514Bm0i60UiJlWUTbtKGNVuMXDrcnw5dLlc1gpxnm5S1Od+wJiLid9MrLfFSGt
         jyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qMBCkTmHyzPP8QfthAqRoy8K2nugdtc5xV9Vl27MCg=;
        b=3EJcW52LmmBSrm5fIAI6wWKdSVdJnwhQnFtDCDRgAn4SFJRUs1++KVTrOs9f90o7XC
         AxRllfvtES1v4fpXW+tU2i5SrBl3cDdSEo30II9b/gYovtlTuR815ny0QDkpTtmwoRSz
         2kdAXL4z/bsjbKaG8HLUr7Se3I4QAUyaVknSBqyYZK9Y/DVhbjZ3Pic23zgGsT80uFsB
         AyvXE8IiuYH4mNb7Sb3srW5FeVB56QutBZoVGWibSIEypnk+LriQWGFDO+wSsEMfBfdR
         w030KydT4SpU4nJ62NJr+Ys6OV6npdG+hejxlb3UGW3jssseot9Y4Z/ez7m1Ie6yc3uv
         4LHQ==
X-Gm-Message-State: AO0yUKXZAFJ6EqkMat6aTS3mqkqq6Sv572UJiUP9bC2SJxhuq3HYlsFE
	QUqdZ6DFbSMVfmB8XREQvQOnVnxgPz2IE/g5FaDod2/w6UON3ti+9gs=
X-Google-Smtp-Source: AK7set8hNHEzBCo8oqW0cZY7IkCLAepXNrb1MYLaNh7XaHeOw+OsQBkh6BdGIr92da51mtXUIsKUJ5USDoPh3SZov20=
X-Received: by 2002:a0d:dc82:0:b0:52e:c770:e0fa with SMTP id
 f124-20020a0ddc82000000b0052ec770e0famr389123ywe.6.1676406236292; Tue, 14 Feb
 2023 12:23:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230213142336.192875-1-zenghuchen@google.com> <202302141029.2CS1z9de-lkp@intel.com>
In-Reply-To: <202302141029.2CS1z9de-lkp@intel.com>
From: Jack Chen <zenghuchen@google.com>
Date: Tue, 14 Feb 2023 15:23:45 -0500
Message-ID: <CALvyBcWVB3XWpiOHKGf5xE+jyqbuMATE8FEX=cpv=bjUOo2cBQ@mail.gmail.com>
Subject: Re: [PATCH] i3c: update dw-i3c-master i3c_clk_cfg function
To: kernel test robot <lkp@intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, oe-kbuild-all@lists.linux.dev, 
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jesus Sanchez-Palencia <jesussanp@google.com>, Mark Slevinsky <markslevinsky@google.com>
Content-Type: text/plain; charset="UTF-8"

Thanks Intel kernel test robot.
I have submitted the V2 patch, which replaced max with max_t to do a type cast.


On Mon, Feb 13, 2023 at 9:13 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Jack,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on linus/master]
> [also build test WARNING on v6.2-rc8 next-20230213]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jack-Chen/i3c-update-dw-i3c-master-i3c_clk_cfg-function/20230213-222533
> patch link:    https://lore.kernel.org/r/20230213142336.192875-1-zenghuchen%40google.com
> patch subject: [PATCH] i3c: update dw-i3c-master i3c_clk_cfg function
> config: i386-randconfig-s001 (https://download.01.org/0day-ci/archive/20230214/202302141029.2CS1z9de-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.4-39-gce1a6720-dirty
>         # https://github.com/intel-lab-lkp/linux/commit/e85b41ae5bb17077ac7d01bdd13c48ea1f83ea42
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Jack-Chen/i3c-update-dw-i3c-master-i3c_clk_cfg-function/20230213-222533
>         git checkout e85b41ae5bb17077ac7d01bdd13c48ea1f83ea42
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
>         make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/i3c/master/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202302141029.2CS1z9de-lkp@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> drivers/i3c/master/dw-i3c-master.c:544:16: sparse: sparse: incompatible types in comparison expression (different type sizes):
> >> drivers/i3c/master/dw-i3c-master.c:544:16: sparse:    unsigned long *
> >> drivers/i3c/master/dw-i3c-master.c:544:16: sparse:    unsigned char *
>
> vim +544 drivers/i3c/master/dw-i3c-master.c
>
>    517
>    518  static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
>    519  {
>    520          unsigned long core_rate, core_period;
>    521          u32 scl_timing;
>    522          u8 hcnt, lcnt;
>    523
>    524          core_rate = clk_get_rate(master->core_clk);
>    525          if (!core_rate)
>    526                  return -EINVAL;
>    527
>    528          core_period = DIV_ROUND_UP(1000000000, core_rate);
>    529
>    530          hcnt = DIV_ROUND_UP(I3C_BUS_THIGH_MAX_NS, core_period) - 1;
>    531          if (hcnt < SCL_I3C_TIMING_CNT_MIN)
>    532                  hcnt = SCL_I3C_TIMING_CNT_MIN;
>    533
>    534          lcnt = DIV_ROUND_UP(core_rate, master->base.bus.scl_rate.i3c) - hcnt;
>    535          if (lcnt < SCL_I3C_TIMING_CNT_MIN)
>    536                  lcnt = SCL_I3C_TIMING_CNT_MIN;
>    537
>    538          scl_timing = SCL_I3C_TIMING_HCNT(hcnt) | SCL_I3C_TIMING_LCNT(lcnt);
>    539          writel(scl_timing, master->regs + SCL_I3C_PP_TIMING);
>    540
>    541          if (!(readl(master->regs + DEVICE_CTRL) & DEV_CTRL_I2C_SLAVE_PRESENT))
>    542                  writel(BUS_I3C_MST_FREE(lcnt), master->regs + BUS_FREE_TIMING);
>    543
>  > 544          lcnt = max(DIV_ROUND_UP(I3C_BUS_TLOW_OD_MIN_NS, core_period), lcnt);
>    545          scl_timing = SCL_I3C_TIMING_HCNT(hcnt) | SCL_I3C_TIMING_LCNT(lcnt);
>    546          writel(scl_timing, master->regs + SCL_I3C_OD_TIMING);
>    547
>    548          lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR1_SCL_RATE) - hcnt;
>    549          scl_timing = SCL_EXT_LCNT_1(lcnt);
>    550          lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR2_SCL_RATE) - hcnt;
>    551          scl_timing |= SCL_EXT_LCNT_2(lcnt);
>    552          lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR3_SCL_RATE) - hcnt;
>    553          scl_timing |= SCL_EXT_LCNT_3(lcnt);
>    554          lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR4_SCL_RATE) - hcnt;
>    555          scl_timing |= SCL_EXT_LCNT_4(lcnt);
>    556          writel(scl_timing, master->regs + SCL_EXT_LCNT_TIMING);
>    557
>    558          return 0;
>    559  }
>    560
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
