Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E616217751
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 20:02:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 100E8C433C7;
	Tue, 29 Aug 2023 20:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693339352;
	bh=JE20nn87VeHMvshyWGSGKYI7nCSbKrrYSpBfNqUMuvE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=cAlyhXnsGmJZbpRAfExbXqz+UJG/zVK+Rd73KpCAjHsXLBOvByfyIh8k9+G+LU7zT
	 8M3qACrFHRCKO7/EeWNPet4AGflDTQaiEGPusWjezXPb+NR1pglbV+xhb4QeO+ITRy
	 LzkW7d/8PKI0z+ol8rRdpAQ/NUKaMgYY9+vh38O/gMOOS8ZpleRW+tEMZzwGuAXQzK
	 NKHGwEI0b2FARq0jYSKDgh84MidnRj+vldPPYUkf7BgwCfQSYI1THtbklO4pdieylB
	 yFYJGeoUSheazLVVSFwtH0SZ4WsBIlvBp+sFuXidP8OnaL5Oe+KLbp6JhCwAFG4caR
	 QPeuk4L1VHDAw==
Date: Tue, 29 Aug 2023 15:02:29 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Valentin Sinitsyn <valesini@yandex-team.ru>
Cc: kernel test robot <lkp@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>, oe-kbuild-all@lists.linux.dev,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] PCI: Implement custom llseek for sysfs resource
 entries
Message-ID: <20230829200229.GA804314@bhelgaas>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dc7f3f3-b2a0-530d-9688-b725204e3270@yandex-team.ru>

On Mon, Aug 28, 2023 at 12:22:54PM +0500, Valentin Sinitsyn wrote:
> On 25.08.2023 19:10, kernel test robot wrote:
> > Hi Valentine,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> [..]
> > All warnings (new ones prefixed by >>):
> > 
> >     drivers/pci/pci-sysfs.c:1268:12: warning: no previous prototype for 'pci_create_resource_files' [-Wmissing-prototypes]
> >      1268 | int __weak pci_create_resource_files(struct pci_dev *dev) { return 0; }
> >           |            ^~~~~~~~~~~~~~~~~~~~~~~~~
> >     drivers/pci/pci-sysfs.c:1269:13: warning: no previous prototype for 'pci_remove_resource_files' [-Wmissing-prototypes]
> >      1269 | void __weak pci_remove_resource_files(struct pci_dev *dev) { return; }
> >           |             ^~~~~~~~~~~~~~~~~~~~~~~~~
> > > > drivers/pci/pci-sysfs.c:838:15: warning: 'pci_llseek_resource' defined but not used [-Wunused-function]
> >       838 | static loff_t pci_llseek_resource(struct file *filep,
> >           |               ^~~~~~~~~~~~~~~~~~~
> I'm not sure if I should do anything about it: arc doesn't HAVE_* anything
> PCI-related, and pci-sysfs doesn't seem to be written with this case in
> mind. Guarding pci_llseek_resource() with an #ifdef HAVE_AT_LEAST_SOMETHING
> is trivial, but it feels more like a patch to silence a bot than a proper
> fix.

Looks like it will require some untangling to figure out a nice fix,
but I think you *do* need to do something about it because I don't
want to add build errors on any arch.

Bjorn
