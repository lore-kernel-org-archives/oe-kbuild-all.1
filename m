Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F8C23B3
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 12:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fyMqZP1b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699189074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f1HgvMzkgTZ9Ert5Ty0eeOqI1iS7dAZC/TkQplw2tFA=;
	b=fyMqZP1bxSvYfEhA7b2vKSLk4lMeQzPCZ7eeNYWWkO4SV0O0+GsaGF5iP2+TCwLNyiVDgv
	fTVUaeBGd9Xrq9wp1dV+K41JzdQ47RT/3sqYxKgTa2+m/DtYFWxzhdsvs+G7E1NgSkiGEF
	MTI6xeZcZA0SjxMmwp+LwMd9Vdvn8B0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-pkAeOMdGOL-hmBuY9KcXHA-1; Sun, 05 Nov 2023 07:57:53 -0500
X-MC-Unique: pkAeOMdGOL-hmBuY9KcXHA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-54132059c6aso2786748a12.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 05 Nov 2023 04:57:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699189070; x=1699793870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1HgvMzkgTZ9Ert5Ty0eeOqI1iS7dAZC/TkQplw2tFA=;
        b=Jy/8BM8lzaOAOyI1i/I+QH7YiQ5zdRG0PjEe2ZQWhfbn6urtExIm3d1pnjb0MBzasz
         woaKhF1+tJYR8haYjCnJ/VQF6raQtFjSmBopprvz9EBpQrjsMg1nYIE/8gIrUz1+lhBX
         aN2E6nzDN4pe1a1JRULYM3HqtSmtUAsuYYfpGprHpDMf8NKoluVE5k338/XqpJg/Moqb
         ED3zS8x1VvDNLAy3R0LmbP9UoSwTMoLKoPKimwcCu4NZfZUc1FJ2lw42TXfJakPslN1P
         HfMvQ93kOOmf8ckcrVvr3mbjGzwoIh8GENqxznYUPlS4l1ojBDzI+Txk0dSHWcAbSV1e
         8cbQ==
X-Gm-Message-State: AOJu0YyHIraK3QVq+LEHLogb+h4Y4Fftqb3a0kiOI2SJOtzQ74d+5nvw
	9Cs7hK8ir58WcPA9rdRF8eYooicg4hsdobhWif8ucm843hl3Pvq9pbYrpupsQxBxhQj5KI5yzUj
	zRhKgWzCxqpE63UO7JMyKXXGXZg==
X-Received: by 2002:a17:907:1c17:b0:9be:fc60:32d9 with SMTP id nc23-20020a1709071c1700b009befc6032d9mr11171521ejc.47.1699189070709;
        Sun, 05 Nov 2023 04:57:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFln3jJBrFzRCKbbKrPWhGY0Su+bxv92NB8RcPpKgo0QzviSwUqwyL999GOWq2Mnh0i9a9wQA==
X-Received: by 2002:a17:907:1c17:b0:9be:fc60:32d9 with SMTP id nc23-20020a1709071c1700b009befc6032d9mr11171513ejc.47.1699189070385;
        Sun, 05 Nov 2023 04:57:50 -0800 (PST)
Received: from redhat.com ([2.55.35.234])
        by smtp.gmail.com with ESMTPSA id gs10-20020a170906f18a00b009b65b2be80bsm2990280ejb.76.2023.11.05.04.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 04:57:49 -0800 (PST)
Date: Sun, 5 Nov 2023 07:57:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: Shannon Nelson <shannon.nelson@amd.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: drivers/vdpa/pds/debugfs.c:269:49: warning: '%02d' directive
 output may be truncated writing between 2 and 11 bytes into a region of size
 6
Message-ID: <20231105075350-mutt-send-email-mst@kernel.org>
References: <202311040109.RfgJoE7L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202311040109.RfgJoE7L-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Nov 04, 2023 at 01:36:05AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   8f6f76a6a29f36d2f3e4510d0bde5046672f6924
> commit: 9a8864d2a8dc5c49acd66284fd382871d99b5db8 pds_vdpa: pds_vdps.rst and Kconfig
> date:   4 months ago
> config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231104/202311040109.RfgJoE7L-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040109.RfgJoE7L-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311040109.RfgJoE7L-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/vdpa/pds/debugfs.c: In function 'pds_vdpa_debugfs_add_vdpadev':
> >> drivers/vdpa/pds/debugfs.c:269:49: warning: '%02d' directive output may be truncated writing between 2 and 11 bytes into a region of size 6 [-Wformat-truncation=]
>      269 |                 snprintf(name, sizeof(name), "vq%02d", i);
>          |                                                 ^~~~
>    drivers/vdpa/pds/debugfs.c:269:46: note: directive argument in the range [-2147483641, 254]
>      269 |                 snprintf(name, sizeof(name), "vq%02d", i);
>          |                                              ^~~~~~~~
>    drivers/vdpa/pds/debugfs.c:269:17: note: 'snprintf' output between 5 and 14 bytes into a destination of size 8
>      269 |                 snprintf(name, sizeof(name), "vq%02d", i);
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> vim +269 drivers/vdpa/pds/debugfs.c

> 151cc834f3ddafe Shannon Nelson 2023-05-19  259  
> 151cc834f3ddafe Shannon Nelson 2023-05-19  260  void pds_vdpa_debugfs_add_vdpadev(struct pds_vdpa_aux *vdpa_aux)
> 151cc834f3ddafe Shannon Nelson 2023-05-19  261  {
> 151cc834f3ddafe Shannon Nelson 2023-05-19  262  	int i;
> 151cc834f3ddafe Shannon Nelson 2023-05-19  263  
> 151cc834f3ddafe Shannon Nelson 2023-05-19  264  	debugfs_create_file("config", 0400, vdpa_aux->dentry, vdpa_aux->pdsv, &config_fops);
> 151cc834f3ddafe Shannon Nelson 2023-05-19  265  
> 151cc834f3ddafe Shannon Nelson 2023-05-19  266  	for (i = 0; i < vdpa_aux->pdsv->num_vqs; i++) {
> 151cc834f3ddafe Shannon Nelson 2023-05-19  267  		char name[8];
> 151cc834f3ddafe Shannon Nelson 2023-05-19  268  
> 151cc834f3ddafe Shannon Nelson 2023-05-19 @269  		snprintf(name, sizeof(name), "vq%02d", i);
> 151cc834f3ddafe Shannon Nelson 2023-05-19  270  		debugfs_create_file(name, 0400, vdpa_aux->dentry,
> 151cc834f3ddafe Shannon Nelson 2023-05-19  271  				    &vdpa_aux->pdsv->vqs[i], &vq_fops);
> 151cc834f3ddafe Shannon Nelson 2023-05-19  272  	}
> 151cc834f3ddafe Shannon Nelson 2023-05-19  273  }
> 151cc834f3ddafe Shannon Nelson 2023-05-19  274  


So gcc can't figure out that i is positive in this loop :(

Let's make it unsigned I guess? Should calm it down.

Shannon could you send a patch please?

> 
> :::::: The code at line 269 was first introduced by commit
> :::::: 151cc834f3ddafec869269fe48036460d920d08a pds_vdpa: add support for vdpa and vdpamgmt interfaces
> 
> :::::: TO: Shannon Nelson <shannon.nelson@amd.com>
> :::::: CC: Michael S. Tsirkin <mst@redhat.com>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

