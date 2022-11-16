Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9BA57F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Nov 2022 07:54:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7A0511FB;
	Tue, 15 Nov 2022 23:54:30 -0800 (PST)
Received: from bogus (unknown [10.57.6.137])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DB473F73B;
	Tue, 15 Nov 2022 23:54:22 -0800 (PST)
Date: Wed, 16 Nov 2022 07:54:20 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	oe-kbuild-all@lists.linux.dev, linux-acpi@vger.kernel.org,
	devel@acpica.org, linux-pm@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [rafael-pm:bleeding-edge 67/68] arch/arm64/kernel/acpi.c:433:5:
 warning: no previous prototype for 'acpi_ffh_address_space_arch_setup'
Message-ID: <20221116075420.xuimwdwu3om7jng2@bogus>
References: <202211150900.CUzIO2xF-lkp@intel.com>
 <20221115101314.pz53eb54rt4ngojm@bogus>
 <CAJZ5v0jDMk=0A1ch9P9eeiKXGdaTLS-JnC-vxfKD4u0WmSTp7w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0jDMk=0A1ch9P9eeiKXGdaTLS-JnC-vxfKD4u0WmSTp7w@mail.gmail.com>

On Tue, Nov 15, 2022 at 02:05:16PM +0100, Rafael J. Wysocki wrote:
> On Tue, Nov 15, 2022 at 11:13 AM Sudeep Holla <sudeep.holla@arm.com> wrote:

[...]

> > I am aware of these warnings and left it unaddressed for consistency. There
> > are few(6-8) such instance with similar warnings upstream as well. Let me know
> > if you prefer to get them fixed, I can fix them all in one go if you are fine
> > with that.
> 
> Well, it would be good to fix those, at least for the sake of reducing
> noise if nothing else.

Sure, done now[1].

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/all/20221116074930.3292121-1-sudeep.holla@arm.com
