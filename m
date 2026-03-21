Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C770136672
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 22:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774130954; cv=none; b=DTA/btwfRRyO6z5AmJK3TX6xKKfrM7Gy8Fp4GTZp1H31J6Pi5UCRF9I1zaORvlibsHU/uUUaFZbv5tQ4u8fa0HuIplnMCtUqPS+aufmm6IZbjv4pPD+D3mdw6KAKbbGQSUJA6zJB1YdcvmewNTwZzCFCJhKy8Wvu8SbSUiHqIQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774130954; c=relaxed/simple;
	bh=Ak5MdV5sS+1RAZVk3ZWFHvRnmnUDrX5M+aya7EEdV8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I6XsYhSKR7IUnl9yYyGB1X322mGN04jc+qYsXbTWkZWFlnmKL7BUY2AooTZnpXdaqMuS1ASb6WqxB3f6vNs0u38yj2NEa7wrIdBDKD1kVFAnKxtB6wL0rBaxe5AZXelV66TQBGWV9pZA+I+HhOcJCUIHo3Kd+0IpHcw7/u2+A7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=groves.net; spf=pass smtp.mailfrom=groves.net; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=groves.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=groves.net
Received: from omf20.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id CBB371E36D;
	Sat, 21 Mar 2026 22:01:14 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: john@groves.net) by omf20.hostedemail.com (Postfix) with ESMTPA id 9D7A120027;
	Sat, 21 Mar 2026 22:01:05 +0000 (UTC)
Date: Sat, 21 Mar 2026 17:01:04 -0500
From: John Groves <John@groves.net>
To: kernel test robot <lkp@intel.com>
Cc: John Groves <john@jagalactic.com>, Miklos Szeredi <miklos@szeredi.hu>, 
	Dan Williams <dan.j.williams@intel.com>, Bernd Schubert <bschubert@ddn.com>, 
	Alison Schofield <alison.schofield@intel.com>, oe-kbuild-all@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Amir Goldstein <amir73il@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Stefan Hajnoczi <shajnocz@redhat.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Josef Bacik <josef@toxicpanda.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Chen Linxuan <chenlinxuan@uniontech.com>, James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, Gregory Price <gourry@gourry.net>
Subject: Re: [PATCH V8 05/10] famfs_fuse: GET_DAXDEV message and daxdev_table
Message-ID: <ab8TstSsDmWMdkC6@groves.net>
References: <0100019d06402f14-3a614309-878f-4837-be72-e36fd75d74f6-000000@email.amazonses.com>
 <202603210500.wr4l3DMj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202603210500.wr4l3DMj-lkp@intel.com>
X-Stat-Signature: ceu61hj1e1wkumaonafoxpk1hmnaekjk
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 9D7A120027
X-Session-Marker: 6A6F686E4067726F7665732E6E6574
X-Session-ID: U2FsdGVkX1+aBMBD45LJrZjnyyLNpr+GBTd7NKAbhKI=
X-HE-Tag: 1774130465-981739
X-HE-Meta: U2FsdGVkX18b/wSTvflpZ5ZfT25UEBhKcUu+w/acU3UrDdEeGrldsG/IkVUSUsaaQdBa1GRIgKN7iRh1ub15gGVlWKu67zREn0OnKzNXj3uOJSNZ0JCpQNvQa9YlWpRbwWpYo8tDuF5SBOAqMKXnib/8Jx78BmQhBRJW9XviYdCIW7WxJ9pkSrIG3i6VySDJEINYqZ3zgorH7F0E0DwaqN7IATHknBoE0R0NKxKDfR6iBoxPJHlm7mEeVDfnWtjTk0T6AX3ZogKsH5t9UQ+OrGKgdAhMR7n9KeTPgYlSGAdsXJ6zqOkbU1B2kDWpjKPAnawhfWBd1ZRw237WRzrIr3KstsBdHjX29X9Ymu7VnehyhqVqxcZn6Bl7Dxo9+pYEN2Uaq+3IBPRfZMZrG3ijvLGnBrT+GkTlFVwlWsi7PhTTSJse1kdBDqkoanKYkdi2BW9hBpXSE1TkIBNTSWzrS3ZT/UyF8tI5UOdJnjvjNfLk8CuTHvo4fBoMI4mElldPcqPT2xhOstGrt1iUxNPJkA==

On 26/03/21 05:33AM, kernel test robot wrote:
> Hi John,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on mszeredi-fuse/for-next]
> [also build test ERROR on brauner-vfs/vfs.all linus/master v7.0-rc4 next-20260320]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/John-Groves/famfs_fuse-Basic-fuse-kernel-ABI-enablement-for-famfs/20260320-152719
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git for-next
> patch link:    https://lore.kernel.org/r/0100019d06402f14-3a614309-878f-4837-be72-e36fd75d74f6-000000%40email.amazonses.com
> patch subject: [PATCH V8 05/10] famfs_fuse: GET_DAXDEV message and daxdev_table
> config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260321/202603210500.wr4l3DMj-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603210500.wr4l3DMj-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603210500.wr4l3DMj-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    fs/fuse/famfs.c: In function 'famfs_fuse_get_daxdev':
> >> fs/fuse/famfs.c:163:32: error: implicit declaration of function 'dax_dev_get' [-Wimplicit-function-declaration]
>      163 |                 daxdev->devp = dax_dev_get(daxdev->devno);
>          |                                ^~~~~~~~~~~
> >> fs/fuse/famfs.c:163:30: error: assignment to 'struct dax_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>      163 |                 daxdev->devp = dax_dev_get(daxdev->devno);
>          |                              ^

The fuse_famfs patches are dependent on the famfs dax patches (which include
the missing dax_dev_get() function. The plan that we have discussed from the 
dax side is for Ira to pull in the famfs dax patches, and then for Miklos to 
pull that branch from Ira, and base the fuse_famfs on top of that. 

I'll be pushing some minor revisions to the dax series early this week. At
that point I hope that series is ready.

Looks like the famfs series is no longer in Miklos' for-next; does this
approach work for you, Miklos?

Thanks,
John


