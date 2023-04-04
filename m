Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E92233DA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 10:07:20 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id y14so32210605wrq.4
        for <oe-kbuild-all@lists.linux.dev>; Tue, 04 Apr 2023 03:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680602838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eM+Kd50JR+321hTmAeOgrh/Eol6OBRvSkPkfL3Sie9A=;
        b=TeCHuBxfJL2U6dWw1BNY2H/t39DC0TmM42nq7aQMT4iE40FmgkwvXamH1XAFO4sHIL
         YAoh4cXHAAoQVwZm7G8sOvolq00uMqi3zJA+334bME6JzzNqKizOREUAm9QPPOHPQMjU
         6bYgCjV3xTIxlnRV9fvmf7cEjqasyUchUe1Ak2WYwnBgPzaCXAGk5imUEQ1rtGkUsw0t
         ktvZN0pap4A0322WysLkO84Csb9jNUHK7GmaW1fx9e0ToKc4i10s6+WyRkxcdPVWJf0h
         sfjJqeZLWttihuSVNlKXR2azmIdtBKUg9Wmy1yqYXETECF5r6qSCWmYq8DAXiLAkl7b8
         wqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680602838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eM+Kd50JR+321hTmAeOgrh/Eol6OBRvSkPkfL3Sie9A=;
        b=6s6Xpl3JRQZhqM+KHuIjYZH80+k3BfbiX8vz3BmIpsRRLZ7GLlNuOFtu4mdXBpUvFd
         LIqWbT4SP6GvS+8XlP1OQ6gvgzPVJtpmVfYlIkeb67K28fDHUZNJNHTQYWe9VaWZ5blX
         jywEL0+uSxj6uN1LFP74MBQqeRI5kFNBlkzE1dnHDSMltq6wPW3GKSEUgkl3FQ970x59
         sh/7iFqqpflW7GYrtXEGYkecbju4Ip4jM4xZJ0KJ8jqb76WIHidoAB5Hqveqo8z8vQQo
         iqQqmvIXaB0z+9U7OAfDzYzLvxeJIDkYrJC0In+WG4RX5rYM7/RT07cTD9xyrAAIiL0/
         5cIw==
X-Gm-Message-State: AAQBX9fpSKRZPDrfQD8mIeZZvkwfHQlxqGFdVfLkjAONK0lZBlR7FTNi
	THJ0WOfuMtHepnV+TLEktLQ=
X-Google-Smtp-Source: AKy350ZFVFCylRWDEJICvkzv945j8Xx9k23Os8YbkI3ACNtsSoXwMGjYKQWHzqKc9++w/d11ahrNkA==
X-Received: by 2002:a5d:5943:0:b0:2ce:aa0e:c60b with SMTP id e3-20020a5d5943000000b002ceaa0ec60bmr1039770wri.53.1680602838455;
        Tue, 04 Apr 2023 03:07:18 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a6-20020adffb86000000b002e8e1a94b19sm5545678wrr.13.2023.04.04.03.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 03:07:17 -0700 (PDT)
Date: Tue, 4 Apr 2023 13:07:14 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	kernel test robot <lkp@intel.com>,
	Orlando Chamberlain <orlandoch.dev@gmail.com>
Subject: Re: sparse false-positive ? (was [linux-next:master 3256/8744]
 drivers/platform/x86/apple-gmux.c:224:48: sparse: sparse: incorrect type in
 argument 1 (different address spaces))
Message-ID: <f4beb5cb-8887-41a5-9ef8-35e163e2f509@kili.mountain>
References: <202304040401.IMxt7Ubi-lkp@intel.com>
 <a07aa39e-4a70-6942-9837-717a69484e96@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a07aa39e-4a70-6942-9837-717a69484e96@redhat.com>

On Tue, Apr 04, 2023 at 11:50:17AM +0200, Hans de Goede wrote:
> Dan,
> 
> Can you perhaps help me understand the following sparse warnings,
> they seem like false-positives to me. But I'm not used to
> sparse giving false-positives so I think I might be missing something
> here ?
> 
> On 4/3/23 22:39, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   31bd35b66249699343d2416658f57e97314a433a
> > commit: 0c18184de990e63f708b090bcb9fc6c0fbc427cd [3256/8744] platform/x86: apple-gmux: support MMIO gmux on T2 Macs
> > config: x86_64-randconfig-s023-20230403 (https://download.01.org/0day-ci/archive/20230404/202304040401.IMxt7Ubi-lkp@intel.com/config)
> > compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> > reproduce:
> >         # apt-get install sparse
> >         # sparse version: v0.6.4-39-gce1a6720-dirty
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=0c18184de990e63f708b090bcb9fc6c0fbc427cd
> >         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> >         git fetch --no-tags linux-next master
> >         git checkout 0c18184de990e63f708b090bcb9fc6c0fbc427cd
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
> >         make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/platform/x86/
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Link: https://lore.kernel.org/oe-kbuild-all/202304040401.IMxt7Ubi-lkp@intel.com/
> > 
> > sparse warnings: (new ones prefixed by >>)
> >>> drivers/platform/x86/apple-gmux.c:224:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned char [usertype] * @@
> >    drivers/platform/x86/apple-gmux.c:224:48: sparse:     expected void const [noderef] __iomem *
> >    drivers/platform/x86/apple-gmux.c:224:48: sparse:     got unsigned char [usertype] *
> 
> So apple-gmux.c:224 for the commit these sparse warnings are about reads:
> 
> 	u8 gwr = ioread8(gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
> 
> Where gmux_data is a "struct apple_gmux_data *" and the iomem_base member is:
> 
> 	u8 *__iomem iomem_base;
> 

The __iomem should go before the *.

	u8 __iomem *iomem_base;

regards,
dan carpenter

