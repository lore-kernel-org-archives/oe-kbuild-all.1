Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A65F7E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 07:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L9dNKUZ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698997159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1ZuQohmnOldmW1VHy4ROYujf3sIsVkqTMbg2gI0VTvA=;
	b=L9dNKUZ+IyyPbjQuO8my6Bz2y+occBUap3gQs10HuL/dtA0wfvzyk2uICj8ygSEcA2LiVX
	yzd7fXAhB7GPlP6dlKD+nd8wQeXZjNmlI0Gx8RIcdQLO/CHTTefEIBY/X60n4TgrUvk3qP
	4xKZFCnhNvS3LXpoV1wiz8LAfkpZhhk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-0G5D_NLQNaClc_kN-XH7Gw-1; Fri, 03 Nov 2023 03:39:17 -0400
X-MC-Unique: 0G5D_NLQNaClc_kN-XH7Gw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-40855a91314so11615265e9.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 03 Nov 2023 00:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698997156; x=1699601956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZuQohmnOldmW1VHy4ROYujf3sIsVkqTMbg2gI0VTvA=;
        b=GjotNmXEVVmFE9XZ7gd0tAyZCfUCd+VPohsmPG7vp7ou/1VD+KR0IDUPgducRlyoJN
         1S7EfG7cgd+486V3Na8aRtTU/fbzPrbhCio3lfhQ8pnSEl6w0bRIgB3Am2ELS4fSqJ2Z
         A0HsHIbZh7VThCcKIKHh5+WzEpKcFIyKmEPKo9bzzGFgSX+j1X8Zq0CHzIQ4nYZb1Arv
         vWCLSgwCKEfbZzlAtz2MqrFsvGTmliObhRWvlfMdkMh6OHOj45YyU6kFW7Mdr/dkFwEe
         5PH929C+AXLqmVXDiiTlAJNxwSpiGt6WAkOPO/WyGb9PhQF6Gd1vWZc7dwcYErfoRJTA
         vkBg==
X-Gm-Message-State: AOJu0Yyg4gIEwYr7rTZ0pOGpbcESx9XfIiQLBTYPYwH4Rfs1jCYDSEwf
	2b4ruaHW2zvgWm4GLkUJVpVgABWtFIC7lIlQVcmexlLRwpEyXtdpXsSCWrWvSeTvPVWvlSFQhg9
	hhjp0TwCGa6x7+/UmW/AL2JuHgg==
X-Received: by 2002:a05:600c:4313:b0:401:c7ec:b930 with SMTP id p19-20020a05600c431300b00401c7ecb930mr1838751wme.10.1698997156168;
        Fri, 03 Nov 2023 00:39:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsPxlKYqAwFNSXNswHyQdCOpU9lVHJsDEKqDQ0yhKTs/DCMk3R2BvFerg99LrQVPM6Xpycwg==
X-Received: by 2002:a05:600c:4313:b0:401:c7ec:b930 with SMTP id p19-20020a05600c431300b00401c7ecb930mr1838728wme.10.1698997155784;
        Fri, 03 Nov 2023 00:39:15 -0700 (PDT)
Received: from redhat.com ([2a02:14f:174:efc3:a5be:5586:34a6:1108])
        by smtp.gmail.com with ESMTPSA id bg19-20020a05600c3c9300b0040531f5c51asm1583577wmb.5.2023.11.03.00.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 00:39:14 -0700 (PDT)
Date: Fri, 3 Nov 2023 03:39:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: Yishai Hadas <yishaih@nvidia.com>, alex.williamson@redhat.com,
	jasowang@redhat.com, jgg@nvidia.com, oe-kbuild-all@lists.linux.dev,
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
	parav@nvidia.com, feliu@nvidia.com, jiri@nvidia.com,
	kevin.tian@intel.com, joao.m.martins@oracle.com,
	si-wei.liu@oracle.com, leonro@nvidia.com, maorg@nvidia.com
Subject: Re: [PATCH V2 vfio 5/9] virtio-pci: Initialize the supported admin
 commands
Message-ID: <20231103033834-mutt-send-email-mst@kernel.org>
References: <20231029155952.67686-6-yishaih@nvidia.com>
 <202311030838.GjyaBTjM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202311030838.GjyaBTjM-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 03, 2023 at 08:33:06AM +0800, kernel test robot wrote:
> Hi Yishai,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on awilliam-vfio/for-linus]
> [also build test WARNING on linus/master v6.6]
> [cannot apply to awilliam-vfio/next mst-vhost/linux-next next-20231102]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Yishai-Hadas/virtio-Define-feature-bit-for-administration-virtqueue/20231030-000414
> base:   https://github.com/awilliam/linux-vfio.git for-linus
> patch link:    https://lore.kernel.org/r/20231029155952.67686-6-yishaih%40nvidia.com
> patch subject: [PATCH V2 vfio 5/9] virtio-pci: Initialize the supported admin commands
> config: i386-randconfig-061-20231102 (https://download.01.org/0day-ci/archive/20231103/202311030838.GjyaBTjM-lkp@intel.com/config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311030838.GjyaBTjM-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311030838.GjyaBTjM-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> drivers/virtio/virtio_pci_modern.c:726:16: sparse: sparse: restricted __le16 degrades to integer
> 
> vim +726 drivers/virtio/virtio_pci_modern.c
> 
>    673	
>    674	static int vp_modern_admin_cmd_exec(struct virtio_device *vdev,
>    675					    struct virtio_admin_cmd *cmd)
>    676	{
>    677		struct scatterlist *sgs[VIRTIO_AVQ_SGS_MAX], hdr, stat;
>    678		struct virtio_pci_device *vp_dev = to_vp_device(vdev);
>    679		struct virtio_admin_cmd_status *va_status;
>    680		unsigned int out_num = 0, in_num = 0;
>    681		struct virtio_admin_cmd_hdr *va_hdr;
>    682		struct virtqueue *avq;
>    683		u16 status;
>    684		int ret;
>    685	
>    686		avq = virtio_has_feature(vdev, VIRTIO_F_ADMIN_VQ) ?
>    687			vp_dev->admin_vq.info.vq : NULL;
>    688		if (!avq)
>    689			return -EOPNOTSUPP;
>    690	
>    691		va_status = kzalloc(sizeof(*va_status), GFP_KERNEL);
>    692		if (!va_status)
>    693			return -ENOMEM;
>    694	
>    695		va_hdr = kzalloc(sizeof(*va_hdr), GFP_KERNEL);
>    696		if (!va_hdr) {
>    697			ret = -ENOMEM;
>    698			goto err_alloc;
>    699		}
>    700	
>    701		va_hdr->opcode = cmd->opcode;
>    702		va_hdr->group_type = cmd->group_type;
>    703		va_hdr->group_member_id = cmd->group_member_id;
>    704	
>    705		/* Add header */
>    706		sg_init_one(&hdr, va_hdr, sizeof(*va_hdr));
>    707		sgs[out_num] = &hdr;
>    708		out_num++;
>    709	
>    710		if (cmd->data_sg) {
>    711			sgs[out_num] = cmd->data_sg;
>    712			out_num++;
>    713		}
>    714	
>    715		/* Add return status */
>    716		sg_init_one(&stat, va_status, sizeof(*va_status));
>    717		sgs[out_num + in_num] = &stat;
>    718		in_num++;
>    719	
>    720		if (cmd->result_sg) {
>    721			sgs[out_num + in_num] = cmd->result_sg;
>    722			in_num++;
>    723		}
>    724	
>    725		if (cmd->opcode == VIRTIO_ADMIN_CMD_LIST_QUERY ||
>  > 726		    cmd->opcode == VIRTIO_ADMIN_CMD_LIST_USE)

yes, this is broken on BE. You need to convert enums to LE before you
compare.

>    727			ret = __virtqueue_exec_admin_cmd(&vp_dev->admin_vq, sgs,
>    728					       out_num, in_num,
>    729					       sgs, GFP_KERNEL);
>    730		else
>    731			ret = virtqueue_exec_admin_cmd(&vp_dev->admin_vq, sgs,
>    732					       out_num, in_num,
>    733					       sgs, GFP_KERNEL);
>    734		if (ret) {
>    735			dev_err(&vdev->dev,
>    736				"Failed to execute command on admin vq: %d\n.", ret);
>    737			goto err_cmd_exec;
>    738		}
>    739	
>    740		status = le16_to_cpu(va_status->status);
>    741		if (status != VIRTIO_ADMIN_STATUS_OK) {
>    742			dev_err(&vdev->dev,
>    743				"admin command error: status(%#x) qualifier(%#x)\n",
>    744				status, le16_to_cpu(va_status->status_qualifier));
>    745			ret = -status;
>    746		}
>    747	
>    748	err_cmd_exec:
>    749		kfree(va_hdr);
>    750	err_alloc:
>    751		kfree(va_status);
>    752		return ret;
>    753	}
>    754	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

