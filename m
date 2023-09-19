Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6466937C8A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 13:54:22 +0000 (UTC)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5711d5dac14so1416761eaf.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 06:54:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695131661; x=1695736461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGZwcNp/BDkTKowBUFhaDEFH4i6kTTCF8Ze198+CeFs=;
        b=e7vyroFqZc5Rk158/noYWlFzRvSmDj1YMdlGPUc4CbjVkIthcp11JYiJK7booEed4x
         wbfG5eiJDVfzhTJlqDRAWHGtObKtZXxBzolvQ+AFHLGLWEYBsnyVcUFya1vpNOR/5Sln
         0V286b5WFKIorbIVtNSKL+Q3AH2yS8Q4c0uURbHaz6nMtUQQuWrkMi3XYMMlOvZDnWm2
         kaSDxakrXBuHzp55GSUYfR+kq++1Fit2vT94GQEppdedy2GIWoItT2cls4kQl87WsKEZ
         C5yh3mZksqTPzGhWY3PN0PVTw2Pr1PpJg9+Vu2VPZwhuXT1435gu7XUIUX1ECUf69e/g
         0d9A==
X-Gm-Message-State: AOJu0Yzo5IQ8pTKDv1ed9YMAsF0QjniEhi3rBia5N5QiBNpOvVfLOVnV
	nMAhKonCl8MyC2qssz2PSJxtN6muqlwUo0M8aDA=
X-Google-Smtp-Source: AGHT+IFQB7YxuOS88mI54AX4AvOgSEg4or2jItYtcrjeKPDUXY02dmKR/Z7d/TdkCkis8oHfOuq35bTUnaTOZnZphFM=
X-Received: by 2002:a4a:d88d:0:b0:573:2a32:6567 with SMTP id
 b13-20020a4ad88d000000b005732a326567mr11216372oov.0.1695131661262; Tue, 19
 Sep 2023 06:54:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230913164659.9345-3-sumitg@nvidia.com> <202309140915.2J9OzWIZ-lkp@intel.com>
 <c180c1e9-c15c-b4e2-678a-35a388a4a613@nvidia.com>
In-Reply-To: <c180c1e9-c15c-b4e2-678a-35a388a4a613@nvidia.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 19 Sep 2023 15:54:09 +0200
Message-ID: <CAJZ5v0iJYb3cAq6VMY8s+AOmuMdCBY9KvshM8rcGnCT-tn8CmQ@mail.gmail.com>
Subject: Re: [Patch v2 2/2] ACPI: processor: reduce CPUFREQ thermal reduction
 pctg for Tegra241
To: Sumit Gupta <sumitg@nvidia.com>
Cc: kernel test robot <lkp@intel.com>, rafael@kernel.org, rui.zhang@intel.com, lenb@kernel.org, 
	treding@nvidia.com, jonathanh@nvidia.com, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, sanjayc@nvidia.com, ksitaraman@nvidia.com, 
	srikars@nvidia.com, jbrasen@nvidia.com, bbasu@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 1:27=E2=80=AFPM Sumit Gupta <sumitg@nvidia.com> wro=
te:
>
>
>
> > Hi Sumit,
> >
> > kernel test robot noticed the following build warnings:
> >
> > [auto build test WARNING on rafael-pm/linux-next]
> > [also build test WARNING on linus/master v6.6-rc1 next-20230913]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Sumit-Gupta/ACPI=
-thermal-Add-Thermal-fast-Sampling-Period-_TFP-support/20230914-004929
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm=
.git linux-next
> > patch link:    https://lore.kernel.org/r/20230913164659.9345-3-sumitg%4=
0nvidia.com
> > patch subject: [Patch v2 2/2] ACPI: processor: reduce CPUFREQ thermal r=
eduction pctg for Tegra241
> > config: i386-defconfig (https://download.01.org/0day-ci/archive/2023091=
4/202309140915.2J9OzWIZ-lkp@intel.com/config)
> > compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20230914/202309140915.2J9OzWIZ-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202309140915.2J9OzWIZ-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >>> drivers/acpi/processor_thermal.c:141:6: warning: no previous declarat=
ion for 'acpi_thermal_cpufreq_config_nvidia' [-Wmissing-declarations]
> >      void acpi_thermal_cpufreq_config_nvidia(void)
> >           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
>
> Thank you for the report.
> The below change fixes the warning for me.
>
>   -void acpi_thermal_cpufreq_config_nvidia(void)
>   +static void acpi_thermal_cpufreq_config_nvidia(void)
>
>
> Hi Rafael,
> If there is no other comment. Could you please add the change while
> applying or you prefer me sending new version ?

Please update.

Besides, I haven't said that I will apply it without changes yet.

Thanks!
