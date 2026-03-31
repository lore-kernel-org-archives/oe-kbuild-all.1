Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5A5425CC4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 16:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774975292; cv=none; b=Giau37VSFuzePBRXYeBb3S6WLs4Z5Xh0+RCbjYGvFIYf5No5ZxgaGAeS8/OnzXvOr57kziQeOuR+27hYMo/9hODhBabA6OBllwwk2M6KDC50ammrRFKDh5Kn27YgGAba2osdwWfK+4q6m74anrN3mqfShTd02dWez6dpaxSdvQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774975292; c=relaxed/simple;
	bh=Laq+rWpi8zhN6UtqKe5ZHjwT7cHHkbCW87nionZwLmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CDRY+zWITYZ0gRJyHvEuQ8O1NCMSYgpYvHowKAGwvyrgyoSZ4Gi5LEDw1kmicp27kZzj4swrTB5LJd993wZ01tKZQyzK0L4DyoiNmJQSEljeoefzDLRUXB5chpEjQydsQxtG/cR0TCUv99n9gbg4JpLbU3m5BxLyx/55iQqhrIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=YUfJKOqe; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="YUfJKOqe"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8c70b5594f4so11091185a.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 09:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1774975290; x=1775580090; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7UbP9VLoXHPhfTJUq7FreRO5c3zWt6d2ufCzErRlFM0=;
        b=YUfJKOqeIfinBcw74r3/MPVoOHXkaDb3bM7R3D5KVoemPmmH88eEjV9p2sq5ZqMSmQ
         iJuWXbs4tznR6PRDh1MAr6Dry/0Zm/bK5j/Ge0Mfpow9K2MAEjw0ilNaMhjsbB8VzXpY
         LFDhAh7aDXfqO/NBY4WdHctGEHNRU4zHq+3TR2SDSTdRPMrwqlYWGRSPJO1Wx9ldrabe
         GoClvEPQd1n1/05zg2tTL5CKfkDGEcEmdMwYyyjhJcBAvriaBiQ3Kjf7Wtl93Nx6VWBx
         spY619WoBPBptB+uml/t5m/gVxYE6MI8zAE4hnst475u0zv10w7uXIiR1I6yrO0uZZyN
         LyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774975290; x=1775580090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7UbP9VLoXHPhfTJUq7FreRO5c3zWt6d2ufCzErRlFM0=;
        b=ageN1L6tbfePrEri6tR1K5nm9mpiWtE245nEQp0vTJrsr/6Js9Q0V+sfRlMcwsNOAu
         p2arrM22y/oKK1+1jYUzSoFLpQYavGXCGPIZucn02NKK+TTiexEgR5SLv235Xd4DfFs4
         /7n8eIGS7yzsDuX6eAyZcosSNLzpVtHb5G4DZ6haB98U/PjEDvZx4UXEPPC0hDAHZf7t
         M1o3eXOgP+QU4ob4tsUoJw3bzJQ+SZrX0jIMp7lYJJZkXSoW08eY2a6df/euRo/b9z4x
         7PakYMmW/UD/w2upM4ZH+jlPouNv+Qh6W+8YLrZ5xNgvjHk+ZkjCnFSwxUoE6rDN6vLk
         9lwA==
X-Forwarded-Encrypted: i=1; AJvYcCVVyxcCtRYN+qywVn69m272QRcb4WF9rHFSdcpo90oVS0pBE6b8qLFgPaHm3Eo74iQ/ygMoKTogqUnsRSv/@lists.linux.dev
X-Gm-Message-State: AOJu0YyQKCzbK9DV2K5X9b8McvdyJQDsTrCOyAQPndnuhOZCr2YGr70S
	nIZG6SYxoTPKYwPcLrTfSuzhxu3PQSFEcLDeSxmF+FjHVLaw613fzx5Ct4Ftcl1aMmM=
X-Gm-Gg: ATEYQzxRYFm+c3nk8JbgedV92cXqqm5/7MLIw8n8vtBp2md4rozqVnqEhzUiZzkob0b
	RzD5DxQ+WtWmbpwdXWJWXYXzKM2ionItnIJLlFCDKn/qg1nCv/TwtYVZZLjHEyfayDjXh9Wkt8H
	2wxnk44obvcohglRp9KOKb2zrTiWXEXT8Gd+h4EJmeIMmtEHcRaPJ4ua02x8AKj85IiiOHBSn3t
	EyeiRyxwhtFeisOslxsvi6E6cum6QEDU63to7Zl/mWKB/y6n59ovGhtLIwPD9FBTX7alaRcNVDb
	cf4sQ0fiY+X/yHDuM1+G1di5oHWOIHM/AjzOo7xuqnHaq+vmINUqfIrjJLlr3fXkXr0LigcqWA8
	PZ0ou0UmVuMJPHUKQva9Br6UF9KTpBA2IEwNVH3gb1cRb8rycv9wqpCDY1PZQlUx0o2AsGyLqvw
	N/SwnlGPXKrzHuvFxnNor8s74DwX8vWJbavCMDJMunyGV5zl7BfvUVMTsOW8d91oKR69Zkug==
X-Received: by 2002:a05:620a:f0c:b0:8cf:cee2:e405 with SMTP id af79cd13be357-8d1b640b140mr3541285a.24.1774975286390;
        Tue, 31 Mar 2026 09:41:26 -0700 (PDT)
Received: from ziepe.ca (mctnnbsa70w-159-2-73-22.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.73.22])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d027edc55fsm860960285a.10.2026.03.31.09.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 09:41:25 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1w7c9c-0000000A6ML-3f7s;
	Tue, 31 Mar 2026 13:41:24 -0300
Date: Tue, 31 Mar 2026 13:41:24 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: kernel test robot <lkp@intel.com>
Cc: Pavan Chebbi <pavan.chebbi@broadcom.com>, oe-kbuild-all@lists.linux.dev,
	Andy Gospodarek <gospo@broadcom.com>,
	Dave Jiang <dave.jiang@intel.com>
Subject: Re: [linux-next:master 9909/10350] drivers/fwctl/bnxt/main.c:216:42:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <20260331164124.GL246076@ziepe.ca>
References: <202603281536.oqX5hhg7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202603281536.oqX5hhg7-lkp@intel.com>

On Sat, Mar 28, 2026 at 03:28:52PM +0800, kernel test robot wrote:
>    212			if (!resp->error_code)
>    213				/* bnxt_send_msg() returned much before FW
>    214				 * received the command.
>    215				 */
>  > 216				resp->error_code = rc;

I fixed to this with a cpu_to_le16()

Jason
