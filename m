Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545C120B80B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 20:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751055085; cv=none; b=ghCELOsB+XHOQtu43Hpq7i7Xjr+FpgSjxk4wL5182dH6LyUHV+J3jsAzhx+jy959u/5/k9Vsz+i3/IHnZZAtGphzP+gBxBAHC3q+kuR8IrarL/fCd3kEhZ2S0SlQjcv18X2BOMOLauJa0fi9hj4mffoFeYm5j9YD3Yy7QYZ723U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751055085; c=relaxed/simple;
	bh=TxKmAuf22xBHiZt2TNjQfrHx/IQeMmYLYqVEZtL05DI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qjvpWxbz0DdBu7zTuATtPuuIF5sdnNrNWWutIx4AmK6QEfGCaQGZhjZ8oDCimyPUf+0vN93WhgJZAl3cnESc3yk7r3Qi382Ti2kb0BOwP4i+PVoC3ul4FFkH3SMpRs+5Key2jCeoR/IKkAKyDB3OB0t0+94ZWR+DZ+vHJvDl9tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JQJGuOL9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JQJGuOL9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE37C4CEE3;
	Fri, 27 Jun 2025 20:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751055084;
	bh=TxKmAuf22xBHiZt2TNjQfrHx/IQeMmYLYqVEZtL05DI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JQJGuOL9iGOyvbfaVKhUiUdNH9xGOlEonsBstFc67sh7NrAt61+Uc028plbB6N1a6
	 Vv5lkedY8Nrw4jNkYGAlcZJMr/QrcgZNWQvPaSeYwrKMu/+OUbg1842i3F9QS3Z2yz
	 gW8OHiqprSYWRZWr4inQ8hlRh0wFDZ2ZKuP5QWVhNiT0k/xjouPksVRqgKTadVPKxp
	 fe1inYULNnNGycMYN65/kUDNK7itJ/mSpq4KtFYnDXoxA9nYe5BDamTJNnHIFWMz5h
	 3vvN2826ADAmSOHr8OQX+E7uRiDzajBvz4jKu+wOXxD9tTPRgz92bUHmOqP9AQZG8k
	 /qbCPLevRS8gQ==
From: SeongJae Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>,
	kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 5320/5590] mm/damon/sysfs-schemes.c:1622:32: sparse: sparse: symbol 'damos_sysfs_action_names' was not declared. Should it be static?
Date: Fri, 27 Jun 2025 13:11:22 -0700
Message-Id: <20250627201122.53436-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250627125731.19f70c310cb4f315177e41e6@linux-foundation.org>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 27 Jun 2025 12:57:31 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:

> On Fri, 27 Jun 2025 16:41:02 +0800 kernel test robot <lkp@intel.com> wrote:
[...]
> > sparse warnings: (new ones prefixed by >>)
> > >> mm/damon/sysfs-schemes.c:1622:32: sparse: sparse: symbol 'damos_sysfs_action_names' was not declared. Should it be static?
> 
> Thanks.
> 
> --- a/mm/damon/sysfs-schemes.c~mm-damon-sysfs-schemes-decouple-from-damos_action-fix
> +++ a/mm/damon/sysfs-schemes.c
> @@ -1619,7 +1619,7 @@ struct damos_sysfs_action_name {
>  	char *name;
>  };
>  
> -struct damos_sysfs_action_name damos_sysfs_action_names[] = {
> +static struct damos_sysfs_action_name damos_sysfs_action_names[] = {
>  	{
>  		.action = DAMOS_WILLNEED,
>  		.name = "willneed",
> _

Thank you Andrew.  I posted a same fix[1] but forgot noting that here.  Since
it is same to yours and yours is already added to mm tree, let's keep using
yours unless you mind.

FWIW,

Reviewed-by: SeongJae Park <sj@kernel.org>

[1] https://lore.kernel.org/20250627162806.50589-1-sj@kernel.org


Thanks,
SJ
