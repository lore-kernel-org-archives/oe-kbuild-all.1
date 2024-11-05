Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFC06F307
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 15:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730820869; cv=none; b=ki09J/6m3JjRf1q0S1zy0mWIPcweIG2BRUl2kvsVSKPWzuJSQtVRg+S5miQnMARiNtqwKkDCB5Y4sIWesfIzghev7L3I8wLT0ol3K8VrREfKIeMeyxfvL7ufcTJUGZ3ELKCEuM7jkb6H8Lzb/lp0xh9oRXJwnXoovWb1HmYzlj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730820869; c=relaxed/simple;
	bh=fJPLfI1KFKjqNz8n95qmiW8lDIlrc6VceKfEz7DCPEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KpE1jnJJ2qqMBDnhtQJMCA8EIsiag6nMoVd5Bsj7C4OPWlfyhtUmRZ6fHVsfDCetmoWL4l3cQQGydaEFcP3E0PWHlHE7K1oQnEvNnVLSgXlEENu8BFLnSHgFu1tnJV4YdZLr0TuCrjaPo4FdFrAF2jM5GtLifm9SiRdTchX5hw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 54D39227AAC; Tue,  5 Nov 2024 16:34:23 +0100 (CET)
Date: Tue, 5 Nov 2024 16:34:22 +0100
From: Christoph Hellwig <hch@lst.de>
To: kernel test robot <lkp@intel.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.de>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Bart Van Assche <bvanassche@acm.org>
Subject: Re: block/blk-zoned.c:579:5-24: WARNING: atomic_dec_and_test
 variation before object free at line 583.
Message-ID: <20241105153422.GA7132@lst.de>
References: <202411050650.ilIZa8S7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202411050650.ilIZa8S7-lkp@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Nov 05, 2024 at 06:52:25AM +0800, kernel test robot wrote:
> >> block/blk-zoned.c:579:5-24: WARNING: atomic_dec_and_test variation before object free at line 583.

Does anyone know what this warning is supposed to mean?

