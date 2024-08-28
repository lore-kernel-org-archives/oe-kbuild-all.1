Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301D5200CD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 02:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724812655; cv=none; b=UiBcl5GqJP+nJll9ft0RFzA4R72ojJPmsf1jte2nrbp8iLXpofT3+uuX9BgXy7YhkbfdHRpfTSdmgKtiQcRxwJZV7Vn51b7Dpev6gsIBJjWwUY8PDzdBHbiig1RYVOW+4PH2GAHq/Q5cAzAUNYE8C2eJ6LuF9wFXgVZ8Ec9//LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724812655; c=relaxed/simple;
	bh=R3OfaW2MJMWKum9ZIIQeyKzz91wsnKw1VksJ7slFy9Q=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=HbF0oqw3WTpLt5ILa0n9OSazMOlZUqiYUOQxLs7euQvs2e3KwbW9nOVeqgdCOireO8lPirhvZptoIcr+O0DXyzOXfeqazfnJQ/M0mXELAmcacvPNHoT+waI5HOLnRR0CLTSSsklMbXY4+aAEZvJpoqPuKz/PInak+CoM/WuAnIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=g8WC/VZZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="g8WC/VZZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67237C4AF1B;
	Wed, 28 Aug 2024 02:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1724812654;
	bh=R3OfaW2MJMWKum9ZIIQeyKzz91wsnKw1VksJ7slFy9Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=g8WC/VZZA9Zi7sBJBvRYOKuQnS6VTpAOzEEmQ/aZN8SJ0OWwCsyZDXJ8CIz9i/Flq
	 PT+IfmvlXTvnWm5PnMbdOwW3z5RfxfEHhKzhORN8vhjqGLW5XxwJxMVBOlUWjTGpbs
	 KFr63jBOdQOnn4aV7sYynQB761zrTOwpw4DLkT6M=
Date: Tue, 27 Aug 2024 19:37:33 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 6060/6439] mm/memory_hotplug.c:1811:33:
 error: implicit declaration of function 'unmap_posioned_folio'; did you
 mean 'unmap_poisoned_folio'?
Message-Id: <20240827193733.d2c1e58242607a07eb6e5535@linux-foundation.org>
In-Reply-To: <27e2d62b-ec0b-4737-92a5-242c6651bdc0@huawei.com>
References: <202408260054.ka3zWBLH-lkp@intel.com>
	<27e2d62b-ec0b-4737-92a5-242c6651bdc0@huawei.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Aug 2024 09:52:12 +0800 Kefeng Wang <wangkefeng.wang@huawei.com> wrote:

> Andrew has two typo fix, should I resend all patch with fix-patch squashed?
> 
> + mm-memory-failure-add-unmap_posioned_folio-fix.patch added to 
> mm-unstable branch
> + 
> mm-memory_hotplug-check-hwpoisoned-page-firstly-in-do_migrate_range-fix.patch 
> added to mm-unstable branch
> 

Please just send a patch which fixes the error.  I'll figure it out.
