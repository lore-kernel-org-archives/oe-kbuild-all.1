Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE66376
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Dec 2022 00:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670373623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PsNujvX/Fn/RGbSU/hjSMEvFUx/g85wLbN26rijJ3vg=;
	b=btC94m0abxrIda5NkghJFmV7PqAKZ+Zu2ZTrSJaRUPVMxtxE7zYTD3x434y1ZCJo8HyKqM
	5zZlmoJLgdY5Ysdo45ZdRdx2Tx8vRJL4KRPorfQZ8eHB3KyzNIaCBaFyXKvlczNW0YJD95
	x7joSuWBBsPu2VBarI3e6pvAkJFAOnc=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-282-n5j0vJIuOvuYsGav56wo0g-1; Tue, 06 Dec 2022 19:40:21 -0500
X-MC-Unique: n5j0vJIuOvuYsGav56wo0g-1
Received: by mail-pl1-f199.google.com with SMTP id b17-20020a170903229100b00189da3b178bso6300689plh.7
        for <oe-kbuild-all@lists.linux.dev>; Tue, 06 Dec 2022 16:40:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PsNujvX/Fn/RGbSU/hjSMEvFUx/g85wLbN26rijJ3vg=;
        b=VKlKy4J3o1Nk7V+v1kxoxtnj9WooXsqdtL4diKU3+FyH/Cj9NNcvZYyPDMWtO9Mb2x
         ggJF5qGRs7EzRYCqbGApf/hTDG0SGOiWaV/AFvqn4ALKqi4edsQvbu4ewmBYxqOu64mp
         V0m43ePhOQgUY38S/vpvJnZOkIg8WBExhosCJhCrbOclyv412iSZrAJmtpb5PhG3DQ8H
         Sin1w33i33TP1SNSHZEWupOr6b6lraL6neVkIEJXgMN8KYVqyHKBJ4zRDiZu9ZAEiwTU
         IDGkbeJjtk9X5D0ub2j26okZq0s7KJIMAku7qM/N/nFXf25nVB6IYtiSv2vpXI65xnE1
         05VA==
X-Gm-Message-State: ANoB5pnuNpC3BkVG5pQgizy4sjiQ0R/lhJPK/wGuaaxXnmUGtxUngI9y
	MECS63Q5voAwvXZhsQjZCIN9Kmau4abqdY2X83gS4cB5GHbjzls3aGUyeeku9kx6N155UofdZxw
	jfT6vDn2LpQXcrlH9LbfbV3qtxQ==
X-Received: by 2002:a17:90b:3c91:b0:219:da8f:c6f0 with SMTP id pv17-20020a17090b3c9100b00219da8fc6f0mr11723528pjb.1.1670373620703;
        Tue, 06 Dec 2022 16:40:20 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7yUd5W2add/mwtbcIS9CcXmW8qGtNWG9jes+aOQbClbGrssboKS1jYedUfuPNCBGJ2beFjHA==
X-Received: by 2002:a17:90b:3c91:b0:219:da8f:c6f0 with SMTP id pv17-20020a17090b3c9100b00219da8fc6f0mr11723502pjb.1.1670373620161;
        Tue, 06 Dec 2022 16:40:20 -0800 (PST)
Received: from [10.72.12.244] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id k1-20020a170902c40100b001895b2c4cf6sm13228920plk.297.2022.12.06.16.40.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 16:40:19 -0800 (PST)
Subject: Re: [ceph-client:testing 5/6] fs/ceph/super.c:1486:9: error: no
 member named 's_master_keys' in 'struct super_block'
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 ceph-devel@vger.kernel.org
References: <202212070634.i0I0ZtVz-lkp@intel.com>
From: Xiubo Li <xiubli@redhat.com>
Message-ID: <49a4125b-0885-bb00-8d84-ec8329ec7be1@redhat.com>
Date: Wed, 7 Dec 2022 08:40:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202212070634.i0I0ZtVz-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Thanks for reporting this.

It's just a test patch in the testing branch. And I will fix it.

- Xiubo

On 07/12/2022 07:01, kernel test robot wrote:
> tree:   https://github.com/ceph/ceph-client.git testing
> head:   6950ae50f0998ef6846eab505c452c6bf02070e3
> commit: c90f64b588ffb49a67bbf10c0580cf9051ced56a [5/6] [DO NOT MERGE] ceph: make sure all the files successfully put before unmounting
> config: powerpc-randconfig-r016-20221206
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 6e4cea55f0d1104408b26ac574566a0e4de48036)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install powerpc cross compiling tool for clang build
>          # apt-get install binutils-powerpc-linux-gnu
>          # https://github.com/ceph/ceph-client/commit/c90f64b588ffb49a67bbf10c0580cf9051ced56a
>          git remote add ceph-client https://github.com/ceph/ceph-client.git
>          git fetch --no-tags ceph-client testing
>          git checkout c90f64b588ffb49a67bbf10c0580cf9051ced56a
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash fs/ceph/ mm/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>>> fs/ceph/super.c:1486:9: error: no member named 's_master_keys' in 'struct super_block'
>             if (s->s_master_keys)
>                 ~  ^
>     1 error generated.
>
>
> vim +1486 fs/ceph/super.c
>
>    1471	
>    1472	static void ceph_kill_sb(struct super_block *s)
>    1473	{
>    1474		struct ceph_fs_client *fsc = ceph_sb_to_client(s);
>    1475	
>    1476		dout("kill_sb %p\n", s);
>    1477	
>    1478		ceph_mdsc_pre_umount(fsc->mdsc);
>    1479		flush_fs_workqueues(fsc);
>    1480	
>    1481		/*
>    1482		 * If the encrypt is enabled we need to make sure the delayed
>    1483		 * fput to finish, which will make sure all the inodes will
>    1484		 * be evicted before removing the encrypt keys.
>    1485		 */
>> 1486		if (s->s_master_keys)
>    1487			flush_delayed_fput();
>    1488	
>    1489		kill_anon_super(s);
>    1490	
>    1491		fsc->client->extra_mon_dispatch = NULL;
>    1492		ceph_fs_debugfs_cleanup(fsc);
>    1493	
>    1494		ceph_fscache_unregister_fs(fsc);
>    1495	
>    1496		destroy_fs_client(fsc);
>    1497	}
>    1498	
>

