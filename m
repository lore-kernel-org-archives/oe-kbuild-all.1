Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B592ECE83
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 15:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750174758; cv=none; b=mOPw7WE4WdxexzUvj4UEHXzQwqxOgapuKLHqkvAC3vEhTxh1oWylSVJZAgg4jXfwr9P003u5bHseTmyA5ZWkuq4A48Epo1m/u2wt/iALcCgmLdNoKs1nrY7USmf1/QunfxDzDQA6EGq0Kea44lyCMmDVW95DuD0qVoTRoAJOohA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750174758; c=relaxed/simple;
	bh=zfy6EHe5CDOTdqnNoMOjf4o/PnjkL+mkfT4gkUjbFyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Jo0uY2GLMXsMh5ZRK7TgLFtIUIYExi5g3QqAaJSMZa88mxfoUNHSk0SkNxXrfFa/OKNrJUOqoUbFgy42Bb0bLHY5GXqRgL5F7JZMvnYkRqrY64qiSVXPa0K4+V+dLWwNZZsxRStqFASMQGFXfkbTHH8+cKAJt90d0WyyrHDpbVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cuEbhJ1p; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cuEbhJ1p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750174754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bYA4vNkR1STXIkkbeACF7/tlzHC3egoFZWTXFv+IW1c=;
	b=cuEbhJ1pMJM4XQwzwQGCA/K2HnW6sqtFIeROTdR+HLLXmyZXOvrT40cADYyKF/bJXfBlBK
	GlMJjOOq/82WjI2oLflloX12pkXvH9XUl3tsKrE2kmm+JjGgbxl4sN+Mvxk3QTOTOxWE+a
	OFD2xD0hycza4dt/oFGtLydrN+05m4s=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-114e075MOOirigrGCeYh_w-1; Tue, 17 Jun 2025 11:39:13 -0400
X-MC-Unique: 114e075MOOirigrGCeYh_w-1
X-Mimecast-MFC-AGG-ID: 114e075MOOirigrGCeYh_w_1750174753
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a585dc5f6aso128335591cf.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 08:39:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750174753; x=1750779553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYA4vNkR1STXIkkbeACF7/tlzHC3egoFZWTXFv+IW1c=;
        b=SiSpxmPlzmU/ab8tXdnyqEMWSZPyQ+IpJw4SOVccj/cD8nveskPshRywMU5sxc8Mfo
         wCoZ4tLSwayyQ07CKY+FB1UHgpBH6f2XqzAwSsmD6LN5PpfUSNq2nFtfUjDc0LJKE9n5
         xbfJIMdsVh+m4bCTglCPL7xQAOh53vEcXh0zv1C5bYQh21dqo6zUhLSmWdklvyOLzbhr
         z4Paim6xBSbVbe2mvrrh1mS9dxpaZKaQV3kAqndx31DuzUmopXNjyj4Hsmma8TLYBjMB
         6FNvpoH5UOmD/cv35WI4+lkyNdqLuzK6IwBdNN+5RxLy8oNuzMUqdik/3o8+5RGeoVSD
         byDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVwpJd/u3FNFoHKMURUFXGvZpOtmLXKWXPpf9FTCpbZYbaaJMn/zh4rqeoGa9TX0XZRcul7+gYZWURruT/@lists.linux.dev
X-Gm-Message-State: AOJu0YxTGYZWUMav5YZSQAP4fdoqKoEfEn3tQTCm9S1pcLlqsqm8O6Pp
	cyDt944qoQxeSeNrHKSbm1u7FBN0S0B7aRTY1v4I7rriPiiVugP/76+bDI0xL9J35+vBwKQLTeY
	+4o3SxhXH6oVReXzp2cxKnpNSo6poVYuSFwI0zOk6VH1uHpY0096Kz1hruNBPzrhaO00=
X-Gm-Gg: ASbGnct1DqdQJndI43g2rtU2I/bCOiGjTDfVvYetYpMU9DQk79YCLXHOvHU2qr3gmAM
	62VGgNDKW4V2djJY2JEKhdiOj4eiemY4lQ12jU5ESjVA+PLrBZX2CEWDc7KHXXWHUkNLw5ZKonr
	N6N9hYF8lUhRNp0CbYFpni+egECCBqL3TGppiPkE0Zw1F171wn85r6a1Vt3bY0E/dKb0+8a1a7v
	Cl43qQhCGhA+4z/niiCLkT4KR9PWezbAR+4nJ9piqjWM6P0XGSzei6pWRjhH4MWc1aT9S30eTA6
	vLtwVDmvmDLs0w==
X-Received: by 2002:a05:622a:446:b0:4a5:a4e9:1333 with SMTP id d75a77b69052e-4a73c656171mr237038101cf.49.1750174752385;
        Tue, 17 Jun 2025 08:39:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPIM43/kJAMEA2z+DJQLz3Nfj5J/K0A7FFjpnjYR1h2Y4Z5A/KK2hrX/uNeaSpJOy3GeFrSQ==
X-Received: by 2002:a05:622a:446:b0:4a5:a4e9:1333 with SMTP id d75a77b69052e-4a73c656171mr237037031cf.49.1750174751109;
        Tue, 17 Jun 2025 08:39:11 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a308f55sm62628021cf.28.2025.06.17.08.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 08:39:10 -0700 (PDT)
Date: Tue, 17 Jun 2025 11:39:07 -0400
From: Peter Xu <peterx@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Zi Yan <ziy@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Alex Mastro <amastro@fb.com>, David Hildenbrand <david@redhat.com>,
	Nico Pache <npache@redhat.com>
Subject: Re: [PATCH 4/5] vfio: Introduce vfio_device_ops.get_unmapped_area
 hook
Message-ID: <aFGMG3763eSv9l8b@x1.local>
References: <20250613134111.469884-5-peterx@redhat.com>
 <202506142215.koMEU2rT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202506142215.koMEU2rT-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eJjuwnGeQbepzaibMg3moBIjfkSeOnw6oSshWxKQZqU_1750174753
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Jun 14, 2025 at 10:46:45PM +0800, kernel test robot wrote:
> Hi Peter,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on akpm-mm/mm-everything]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Xu/mm-Deduplicate-mm_get_unmapped_area/20250613-214307
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20250613134111.469884-5-peterx%40redhat.com
> patch subject: [PATCH 4/5] vfio: Introduce vfio_device_ops.get_unmapped_area hook
> config: sh-randconfig-002-20250614 (https://download.01.org/0day-ci/archive/20250614/202506142215.koMEU2rT-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 12.4.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506142215.koMEU2rT-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506142215.koMEU2rT-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/vfio/vfio_main.c: In function 'vfio_device_get_unmapped_area':
> >> drivers/vfio/vfio_main.c:1367:24: error: implicit declaration of function 'mm_get_unmapped_area'; did you mean 'get_unmapped_area'? [-Werror=implicit-function-declaration]
>     1367 |                 return mm_get_unmapped_area(current->mm, file, addr,
>          |                        ^~~~~~~~~~~~~~~~~~~~
>          |                        get_unmapped_area
>    cc1: some warnings being treated as errors
> 
> 
> vim +1367 drivers/vfio/vfio_main.c
> 
>   1356	
>   1357	static unsigned long vfio_device_get_unmapped_area(struct file *file,
>   1358							   unsigned long addr,
>   1359							   unsigned long len,
>   1360							   unsigned long pgoff,
>   1361							   unsigned long flags)
>   1362	{
>   1363		struct vfio_device_file *df = file->private_data;
>   1364		struct vfio_device *device = df->device;
>   1365	
>   1366		if (!device->ops->get_unmapped_area)
> > 1367			return mm_get_unmapped_area(current->mm, file, addr,
>   1368						    len, pgoff, flags);
>   1369	
>   1370		return device->ops->get_unmapped_area(device, file, addr, len,
>   1371						      pgoff, flags);
>   1372	}
>   1373	

This is "ARCH_SH + VFIO + !MMU".. I'll make sure to cover this config when
repost.  I'll squash below into the patch:

diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 19db8e58d223..cc14884d282f 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -1354,6 +1354,7 @@ static int vfio_device_fops_mmap(struct file *filep, struct vm_area_struct *vma)
        return device->ops->mmap(device, vma);
 }
 
+#ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
 static unsigned long vfio_device_get_unmapped_area(struct file *file,
                                                   unsigned long addr,
                                                   unsigned long len,
@@ -1370,6 +1371,7 @@ static unsigned long vfio_device_get_unmapped_area(struct file *file,
        return device->ops->get_unmapped_area(device, file, addr, len,
                                              pgoff, flags);
 }
+#endif
 
 const struct file_operations vfio_device_fops = {
        .owner          = THIS_MODULE,
@@ -1380,7 +1382,9 @@ const struct file_operations vfio_device_fops = {
        .unlocked_ioctl = vfio_device_fops_unl_ioctl,
        .compat_ioctl   = compat_ptr_ioctl,
        .mmap           = vfio_device_fops_mmap,
+#ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
        .get_unmapped_area = vfio_device_get_unmapped_area,
+#endif
 };
 
 static struct vfio_device *vfio_device_from_file(struct file *file)

-- 
Peter Xu

