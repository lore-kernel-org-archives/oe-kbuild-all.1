Content-Type: multipart/mixed; boundary="===============5102538550889366726=="
MIME-Version: 1.0
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: kbuild-all@lists.01.org
Subject: Re: [linux-stable-rc:linux-4.14.y 8384/9999] drivers/iommu/intel-iommu.c:4174:9: warning: variable 'length' set but not used
Date: Thu, 28 May 2020 15:02:41 +0200
Message-ID: <20200528130241.GA3328879@kroah.com>
In-Reply-To: <cb3c0035-b29b-986b-c311-c62afe3d5444@redhat.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5102538550889366726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2020 at 02:58:37PM +0200, Auger Eric wrote:
> Hi,
> =

> On 5/28/20 2:17 PM, kbuild test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-st=
able-rc.git linux-4.14.y
> > head:   4f68020fef1c6cf1b680ffb6481ac41379283ea3
> > commit: f7edbb6415098817533b9024694b2a6c05c74fc1 [8384/9999] iommu/vt-d=
: Duplicate iommu_resv_region objects per device list
> > config: i386-randconfig-a013-20200528 (attached as .config)
> > compiler: gcc-5 (Ubuntu 5.5.0-12ubuntu1) 5.5.0 20171010
> > reproduce (this is a W=3D1 build):
> >         git checkout f7edbb6415098817533b9024694b2a6c05c74fc1
> >         # save the attached .config to linux build tree
> >         make W=3D1 ARCH=3Di386 =

> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kbuild test robot <lkp@intel.com>
> > =

> > All warnings (new ones prefixed by >>, old ones prefixed by <<):
> > =

> > In file included from include/linux/init.h:5:0,
> > from drivers/iommu/intel-iommu.c:23:
> > drivers/iommu/intel-iommu.c: In function 'domain_context_mapping_one':
> > drivers/iommu/intel-iommu.c:2078:15: warning: comparison is always true=
 due to limited range of data type [-Wtype-limits]
> > if (did_old >=3D 0 && did_old < cap_ndoms(iommu->cap)) {
> > ^
> > include/linux/compiler.h:58:30: note: in definition of macro '__trace_i=
f'
> > if (__builtin_constant_p(!!(cond)) ? !!(cond) :                        =
            ^
> > drivers/iommu/intel-iommu.c:2078:3: note: in expansion of macro 'if'
> > if (did_old >=3D 0 && did_old < cap_ndoms(iommu->cap)) {
> > ^
> > drivers/iommu/intel-iommu.c:2078:15: warning: comparison is always true=
 due to limited range of data type [-Wtype-limits]
> > if (did_old >=3D 0 && did_old < cap_ndoms(iommu->cap)) {
> > ^
> > include/linux/compiler.h:58:42: note: in definition of macro '__trace_i=
f'
> > if (__builtin_constant_p(!!(cond)) ? !!(cond) :                        =
                        ^
> > drivers/iommu/intel-iommu.c:2078:3: note: in expansion of macro 'if'
> > if (did_old >=3D 0 && did_old < cap_ndoms(iommu->cap)) {
> > ^
> > drivers/iommu/intel-iommu.c:2078:15: warning: comparison is always true=
 due to limited range of data type [-Wtype-limits]
> > if (did_old >=3D 0 && did_old < cap_ndoms(iommu->cap)) {
> > ^
> > include/linux/compiler.h:69:16: note: in definition of macro '__trace_i=
f'
> > ______r =3D !!(cond);                        ^
> > drivers/iommu/intel-iommu.c:2078:3: note: in expansion of macro 'if'
> > if (did_old >=3D 0 && did_old < cap_ndoms(iommu->cap)) {
> > ^
> > drivers/iommu/intel-iommu.c: In function 'find_or_alloc_domain':
> > drivers/iommu/intel-iommu.c:2556:6: warning: variable 'req_id' set but =
not used [-Wunused-but-set-variable]
> > u16 req_id, dma_alias;
> > ^
> > drivers/iommu/intel-iommu.c: In function 'iommu_prepare_static_identity=
_mapping':
> > drivers/iommu/intel-iommu.c:2994:22: warning: variable 'iommu' set but =
not used [-Wunused-but-set-variable]
> > struct intel_iommu *iommu;
> > ^
> > drivers/iommu/intel-iommu.c: In function 'dmar_parse_one_rmrr':
> > <<                  from drivers/iommu/intel-iommu.c:23:
> >>> drivers/iommu/intel-iommu.c:4174:9: warning: variable 'length' set bu=
t not used [-Wunused-but-set-variable]
> > size_t length;
> > ^
> > drivers/iommu/intel-iommu.c: In function 'intel_iommu_unmap':
> > drivers/iommu/intel-iommu.c:5083:22: warning: variable 'iommu' set but =
not used [-Wunused-but-set-variable]
> > struct intel_iommu *iommu;
> > ^
> > =

> > vim +/length +4174 drivers/iommu/intel-iommu.c
> > =

> > f59c7b69bcba31 drivers/pci/intel-iommu.c   Fenghua Yu    2009-03-27  41=
68  =

> > 318fe7df9d8456 drivers/iommu/intel-iommu.c Suresh Siddha 2011-08-23  41=
69  =

> > c2a0b538d2c778 drivers/iommu/intel-iommu.c Jiang Liu     2014-11-09  41=
70  int __init dmar_parse_one_rmrr(struct acpi_dmar_header *header, void *a=
rg)
> > 318fe7df9d8456 drivers/iommu/intel-iommu.c Suresh Siddha 2011-08-23  41=
71  {
> > 318fe7df9d8456 drivers/iommu/intel-iommu.c Suresh Siddha 2011-08-23  41=
72  	struct acpi_dmar_reserved_memory *rmrr;
> > 318fe7df9d8456 drivers/iommu/intel-iommu.c Suresh Siddha 2011-08-23  41=
73  	struct dmar_rmrr_unit *rmrru;
> > 0659b8dc45a6b1 drivers/iommu/intel-iommu.c Eric Auger    2017-01-19 @41=
74  	size_t length;
> > 318fe7df9d8456 drivers/iommu/intel-iommu.c Suresh Siddha 2011-08-23  41=
75  =

> > 318fe7df9d8456 drivers/iommu/intel-iommu.c Suresh Siddha 2011-08-23  41=
76  	rmrru =3D kzalloc(sizeof(*rmrru), GFP_KERNEL);
> > 318fe7df9d8456 drivers/iommu/intel-iommu.c Suresh Siddha 2011-08-23  41=
77  	if (!rmrru)
> > 0659b8dc45a6b1 drivers/iommu/intel-iommu.c Eric Auger    2017-01-19  41=
78  		goto out;
> > 318fe7df9d8456 drivers/iommu/intel-iommu.c Suresh Siddha 2011-08-23  41=
79  =

> > 318fe7df9d8456 drivers/iommu/intel-iommu.c Suresh Siddha 2011-08-23  41=
80  	rmrru->hdr =3D header;
> > 318fe7df9d8456 drivers/iommu/intel-iommu.c Suresh Siddha 2011-08-23  41=
81  	rmrr =3D (struct acpi_dmar_reserved_memory *)header;
> > 318fe7df9d8456 drivers/iommu/intel-iommu.c Suresh Siddha 2011-08-23  41=
82  	rmrru->base_address =3D rmrr->base_address;
> > 318fe7df9d8456 drivers/iommu/intel-iommu.c Suresh Siddha 2011-08-23  41=
83  	rmrru->end_address =3D rmrr->end_address;
> > 0659b8dc45a6b1 drivers/iommu/intel-iommu.c Eric Auger    2017-01-19  41=
84  =

> > 0659b8dc45a6b1 drivers/iommu/intel-iommu.c Eric Auger    2017-01-19  41=
85  	length =3D rmrr->end_address - rmrr->base_address + 1;
> This was fixed in master branch by
> 42db7c6a404b  iommu/vt-d: Remove an unused variable "length"
> =

> The patch that introduced the warning was:
> 5f64ce5411b4  iommu/vt-d: Duplicate iommu_resv_region objects per device
> list
> Originally it did have the stable tag in the commit message but it was
> sent as stable. We forgot to send 42db7c6a404b to stable as well ...

Thanks, but we really do not care about -Wunused-but-set-variable issues
in stable patches, as they are not relevant for normal builds.

thanks,

greg k-h
--===============5102538550889366726==--

