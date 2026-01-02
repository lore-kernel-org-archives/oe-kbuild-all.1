Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F231885A5;
	Fri,  2 Jan 2026 06:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767335905; cv=none; b=XtugSGwBBlPbzb+KeEiST2ySlWXM2tDNdWC6VGqEIBi15zOFht4iIJ+dTGu4nVYXuNkWLsT5IQA/9EcYxaXvb3RIwAUZbJjX8PXohC5/s/eS0jaLYJqZ6rBGCiq4j/kBh2W1HsH9zxr0mXsUpNHcXZ4TT8ZTn3a4CHBTmRAr2QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767335905; c=relaxed/simple;
	bh=R3AnrFHbh8TQQScS687kHcUSpJvGR+ET28h+IbwlH2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JvDmko+CoQI9hN5aTfMPrEZeMHciCb1jwTqDAWt/9/zv9p8uY7cUnlSUosjlUMURLlWxW0tPBTS8VUYbI6yMU/f4APiKrTVSQcPdIZW5R/alt+8nkdBLhRwbgn6DhxPWP1Hw+IExu9mb36Q02VKf95FQKBICeYfrVmRl6LfKlJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jF7NDBKH; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jF7NDBKH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=O8PnxQIXbNX8jTjg3WSeZx0j/r/E3lYua+dp3OURtzk=; b=jF7NDBKHWbdwi0RclfAS2rjeMD
	plmqkBPyQUJDZqACcbu7+Sh56+AZz7XJwTw1FE4bTYRaEZ33UuKx1IT/tO5+WFLh3WLepm22eJqk3
	RTmxxSsuquDrYEsD+025t9EJus9C8Gi0Vu24dBmkBHIN6Y8tvi6mZCVDzo7vYO1Ri5UgTWT91i79z
	7NWQ3iYZgJhsA/CKz7ZGbosh3bi3juGPk6O3AY8y/iRDp3FSqXiuYEbICyXtc+jJho2KX4pM30//b
	k1PLq0PDXAvYApmjBWlKE2C5VzThMwnfXpLIXjmWdonu4xovuUTUiyzs0HjeNO6vQWCOvqCbT9Bay
	RSG3jNGw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbYnj-00000007r3V-1m4L;
	Fri, 02 Jan 2026 06:38:19 +0000
Message-ID: <424be38c-e315-42e3-9783-51ce34310d38@infradead.org>
Date: Thu, 1 Jan 2026 22:38:18 -0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 1503/2671] htmldocs:
 Documentation/filesystems/api-summary:56: ./fs/namei.c:4953: WARNING: Inline
 emphasis start-string without end-string. [docutils]
To: Matthew Wilcox <willy@infradead.org>
Cc: kernel test robot <lkp@intel.com>,
 Benjamin Coddington <bcodding@hammerspace.com>,
 oe-kbuild-all@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Jeff Layton <jlayton@kernel.org>, linux-doc@vger.kernel.org
References: <202601011410.4vVaIDB9-lkp@intel.com>
 <745448ec-d69f-4f0c-ac02-08c5d757569f@infradead.org>
 <aVc_KwkNGsPxS5jT@casper.infradead.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aVc_KwkNGsPxS5jT@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/1/26 7:44 PM, Matthew Wilcox wrote:
> On Thu, Jan 01, 2026 at 07:36:48PM -0800, Randy Dunlap wrote:
>> fs/open.c is not used in Documentation/ (where the lines were moved _from_).
> 
> That seems like it might be worth a patch?
> 
> +++ b/Documentation/filesystems/api-summary.rst
> @@ -56,6 +56,9 @@ Other Functions
>  .. kernel-doc:: fs/namei.c
>     :export:
> 
> +.. kernel-doc:: fs/open.c
> +   :export:
> +
>  .. kernel-doc:: block/bio.c
>     :export:
> 
> 
> ... of course, then someone would have to check it didn't introduce new
> errors, so it's a bit more work than that.  Perhaps you'd like to take
> care of it?

It seems safe enough unless -Wall or -Wreturn is used (these are not used
by default AFAICT), yielding these warnings:
Warning: fs/open.c:1046 No description found for return value of 'finish_open'
Warning: fs/open.c:1069 No description found for return value of 'finish_no_open'
Warning: fs/open.c:1089 No description found for return value of 'vfs_open'
Warning: fs/open.c:1330 No description found for return value of 'file_open_name'
Warning: fs/open.c:1351 No description found for return value of 'filp_open'
Warning: fs/open.c:1046 No description found for return value of 'finish_open'
Warning: fs/open.c:1069 No description found for return value of 'finish_no_open'
Warning: fs/open.c:1089 No description found for return value of 'vfs_open'
Warning: fs/open.c:1330 No description found for return value of 'file_open_name'
Warning: fs/open.c:1351 No description found for return value of 'filp_open'


Sure, I'll send that patch.

> (and don't we have a script that flags files that have kernel-doc that's
> not included in rst files?)

tools/doc/find-unused-docs.sh

-- 
~Randy

