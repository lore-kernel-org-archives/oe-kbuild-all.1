Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D091D0420
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 15:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727883195; cv=none; b=c5No43RlpropBN+m9fSso5LM6YOff8b2J6hgNm5ZuMhiXOEhgtaZ5g2EFaMfUjltzLrs4EQLtubw3+WEeHlvaIGmICjeHdFJDm8z4KIrtzaAaSF+XFUHQFLWSnMqkVEcfVRyHtHxnPl1NNpZP9AEAaQPQ2HuMhe7vgTDUPVfOqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727883195; c=relaxed/simple;
	bh=1gw/RFjefYRq/TSJcFZ9d6JXFRUn5ifgoyqgOoIlCZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TL14HCQK2OMgDsMzhu7ZhBHvuuHjVabfQ6+4wjzNFcBy78Q8Q/U85azMLninTZdHABCXgUrbYTSQ6QFKgwPwn567drG1BM3LK70Hqi1iZJ5os7rVE3/hQl3gFY1ij7BcGA1vN+GjBCAb3LJmVm6WnOqBjCPFd77K9RKXhLIEv1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c89f3f28b6so3530187a12.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 02 Oct 2024 08:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727883190; x=1728487990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTCC5mB2mGzfNB4TYhiqO1fgrb24xTtLHLngV8SMhOM=;
        b=QAsvi9R0dHiKdNN1/o0liZ3VYVg98q8cAM19kfzv8UuMaZzEoZg6V/5EUHMtbfIOSN
         917TYd6xfNEvgXfDIvR112oSGoZdVHdBq2s05lIAMuhNe27w1IRBC8ew4WU3WGuRT2Bf
         bXpDlmlv2xAO3C6CKLys0/UOchnKAtLVENFdJ/MVhU0t3YPySlkUVO+V1F7fv7BMDr43
         /nkX6bPRNB8sUhD1Mne3l/2bKSHOC+JukYWPOoh0G3wsbiSU97V2tW8fjLcvRAXzVGXa
         rQ9K/Fdl+otBBwxWDC4XzmloE2PXXzv4uo24vLq8Gy0zZ5rDz09g7Y4XGRxKPxp4Fxyh
         P9kg==
X-Forwarded-Encrypted: i=1; AJvYcCU68agxzpQuv4jlfMW/PqT8uoUvcegmGg4c6gwroNEXe0BYjNuYf47o+MBuBTzMZU4vWP8ovEnX0HXSyjLI@lists.linux.dev
X-Gm-Message-State: AOJu0YzNry+r59ZNTI1DkGUdfJqfJUrQELC24t85ZtCsASTuV1AqKRt2
	Isc5vfS4V9ZJ8OI1SPAcFF7Bc3uBuqJtkU/I409qbxHQhZKIVj3d
X-Google-Smtp-Source: AGHT+IGTlngDvQyE5XHwlb44NSGdHpKYSFmAAOESzaCUberpiWnak0XiuQK3AAQr1QsG1u1ZsCrJiA==
X-Received: by 2002:a05:6402:268c:b0:5c8:bb09:a2bb with SMTP id 4fb4d7f45d1cf-5c8bb09a86dmr1662321a12.0.1727883190093;
        Wed, 02 Oct 2024 08:33:10 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-113.fbsv.net. [2a03:2880:30ff:71::face:b00c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8824051b7sm8045167a12.7.2024.10.02.08.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 08:33:09 -0700 (PDT)
Date: Wed, 2 Oct 2024 08:33:05 -0700
From: Breno Leitao <leitao@debian.org>
To: kernel test robot <lkp@intel.com>
Cc: kuba@kernel.org, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, Akinobu Mita <akinobu.mita@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, oe-kbuild-all@lists.linux.dev,
	horms@kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mina Almasry <almasrymina@google.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Willem de Bruijn <willemb@google.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH net-next] net: Implement fault injection forcing skb
 reallocation
Message-ID: <20241002-vague-wapiti-of-aurora-ffec3e@leitao>
References: <20241002113316.2527669-1-leitao@debian.org>
 <202410022209.2TB3siPB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202410022209.2TB3siPB-lkp@intel.com>

On Wed, Oct 02, 2024 at 10:23:25PM +0800, kernel test robot wrote:
> Hi Breno,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on net-next/main]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Breno-Leitao/net-Implement-fault-injection-forcing-skb-reallocation/20241002-193852
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20241002113316.2527669-1-leitao%40debian.org
> patch subject: [PATCH net-next] net: Implement fault injection forcing skb reallocation
> reproduce: (https://download.01.org/0day-ci/archive/20241002/202410022209.2TB3siPB-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410022209.2TB3siPB-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
>    Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
>    Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
>    Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
>    Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
> >> Warning: net/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst

For those interested, this is not an issue, since the fault-injection
documentation is changing to dev-tools, and I am referencing the new
localtion already.

https://lore.kernel.org/all/87ttethota.fsf@trenco.lwn.net/
